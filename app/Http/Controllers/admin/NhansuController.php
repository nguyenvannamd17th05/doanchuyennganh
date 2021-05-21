<?php

namespace App\Http\Controllers\admin;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Hash;
class NhansuController extends Controller
{
    public function list()
    {
    	$user = DB::table('user')->join('role','user.id_role','=','role.id')->select('role.name as rolename','user.*')->get();
        return view('admin.nhansu.list', [
            'user' => $user,
        ]);
    }
    public function register(){
    	$data = DB::table("role")->get();
    	return view('admin.nhansu.register',
    		[
    			'role'=>$data
    		]);
    }
    public function insertrRegister(Request $request){


        $Data = $request->validate([
            'email'=>'required',
            'name'=>'required',
            'password'=>'required'
            
            
        ]);
       $check =   DB::table('user')->insert([
           'email'=> $Data['email'],
           'password'=>Hash::make($Data['password']) ,
           'name'=>$Data['name'],
           'id_role'=>$request->role,
           'authorities'=>1
       ]);
       
       if($check){
           return redirect(route('admins.nhansu.list'));
       }else{
           return redirect(route('admins.nhansu.themregister'));
       }
    
    }
}
