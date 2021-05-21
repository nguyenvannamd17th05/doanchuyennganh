<?php

namespace App\Http\Controllers\admin;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Hash;
use Carbon\Carbon;
use Illuminate\Support\Facades\Storage;
use Illuminate\Support\Str;

class Tintuc extends Controller
{
     public function list()
    {
    	$user = DB::table('user')->join('role','user.id_role','=','role.id')->select('role.name as rolename','user.*')->get();
        return view('admin.tintuc.list', [
            'user' => $user,
        ]);
    }
    public function insert(){
    	$data = DB::table("user")->get();
    	return view('admin.tintuc.insert',
    		[
    			'user'=>$data
    		]);
    }
    public function inserted(Request $request){
    	 $Data = $request->validate([
            'title'=>'required',
           
        ]);
       $check =   DB::table('news')->insertGetId([
           'title'=> $Data['title'],
           
           'description'=>$request->des,
           'id_user'=>$request->author,
           'content'=>$request->content,
           'date_create'=> Carbon::now('Asia/Ho_Chi_Minh')
       ]);
        foreach ($request->hinh as $key => $item) {
                $extension = $item->getClientOriginalExtension();
                $random = Str::random(10);
                $filename = $random . '_' . time() . '.' . $extension;
                $item->storeAs('images/product', $filename);
                DB::table('image')->insert([
                    'title' => "blog",
                    'url' => $filename,
                    'id_blog'=>$check
                ]);
            }
       
       if($check){
           return redirect(route('admins.tintuc.insert'));
       }else{
           return redirect(route('admins.tintuc.insert'));
       }
    
    }
 }
