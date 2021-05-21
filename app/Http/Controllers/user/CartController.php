<?php

namespace App\Http\Controllers\user;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Validator;
use Illuminate\Support\Str;

class CartController extends Controller
{
    //
    public function show()
    {
        return view("page.cart");
    }
    public function addCart(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'soluong' => 'numeric|min:1|required',
            'size' => 'required'
        ], [
            'soluong.numeric' => 'Vui lòng bạn nhập số Số lượng',
            'soluong.min' => 'Vui lòng số lượng lớn hơn 0',
            'soluong.required' => 'Vui lòng bạn nhập số lượng',
            'size.required' => 'Vui lòng bạn chọn size'
        ]);
        if ($validator->fails()) {
            return response()->json([
                'success' => 'false',
                'errors'  => $validator->errors()->all(),
            ], 400);
        } else {
            if ($request->size=="undefined") {
                return response()->json([
                    'success' => 'false',
                    'errors'  => ["Vui lòng bạn chọn kích thước"],
                ], 400);
            }
            $product = DB::table('product')
                ->where('idproduct', '=', $request->id)->first();
            $color = DB::table('colorproduct')
                ->where('colorproduct.idcolorproduct', '=', $request->color)->first();

            $image = DB::table("image")
                ->where('colorproductid', '=', $color->idcolorproduct)->first();

            $size = DB::table('sizeproduct')
                ->where('colorproductid', '=', $color->idcolorproduct)
                ->where('title', '=', $request->size)
                ->first();
            if ($size->amount - $request->soluong < 0) {
                return response()->json([
                    'success' => 'false',
                    'errors'  => ["Số lượng không đủ cửa hàng hiện tại còn $size->amount"],
                ], 400);
            }
            $name = $product->title . ' / ' . $color->title . ' / ' . $size->title;
            $key =  Str::slug($name);
            $cart = [
                "idproduct" => $product->idproduct,
                "idsize" => $size->idcolorproduct,
                'url' => $product->url,
                "Titleproduct" => $name,
                "Amount" => $request->soluong,
                "price" => $product->price,
                "image" => $image->url ?? NULL
            ];
            $request->session()->put("Cart.$key", $cart);
            return view('ajax.cart');
        }
    }

    public function update(Request $request)
    {
        $request->validate(
            [
                'soluong.*' => 'numeric|min:1'
            ]
        );
        $data = $request->except("_token");
        $cart = Session("Cart");
        $i = 0;
        foreach ($cart as $key => $value) {
            $size = DB::table('sizeproduct')
                ->where('idcolorproduct', '=', $value['idsize'])
                ->first();
            if ($size->amount - $data["soluong"][$i] < 0) {
                return response()->json([
                    'success' => 'false',
                    'errors'  => ["Số lượng không đủ cửa hàng hiện tại còn $size->amount theo sản phẩm " . $value['Titleproduct']],
                ], 400);
            }
            $cartnew = [
                "idproduct" => $value['idproduct'],
                "idsize" => $value['idsize'],
                'url' => $value['url'],
                "Titleproduct" =>  $value['Titleproduct'],
                "Amount" => $data["soluong"][$i++],
                "price" => $value['price'],
                "image" => $value['image'] ?? NULL
            ];
            $request->session()->put("Cart.$key", $cartnew);
        }
    }
    public function remove(Request $request)
    {
        $request->session()->forget("Cart.$request->key");
        return redirect("cart");
    }
    public function reset(Request $request)
    {
        $request->session()->forget('Cart');
        return redirect('/');
    }
}
