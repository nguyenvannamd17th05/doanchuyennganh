<?php

namespace App\Http\Controllers\user;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;

use Illuminate\Support\Facades\DB;
class BlogController extends Controller
{
    //
    public function index(){
    	$data  = DB::table('news')->join('user','user.id','=','news.id_user')->join('image','image.id_blog','=','news.id')->select('image.url','news.*','user.name')->get();
    	return view("page.blog",[
    		"news"=>$data
    	]);
    }

    public function details(Request $request){
    	$data  = DB::table('news')->join('user','user.id','=','news.id_user')->where('news.id','=', $request->id)
            ->first();
    	return view("page.blogdetails",[
    		"news"=>$data
    	]);
    }
}
