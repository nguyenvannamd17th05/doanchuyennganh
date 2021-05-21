<?php

namespace App\Http\Controllers\user;

use App\Http\Controllers\Controller;
use Exception;
use Illuminate\Contracts\Session\Session;
use Illuminate\Support\Facades\DB;
use Illuminate\Http\Request;

class ProductController extends Controller
{
    public function Product()
    {
        $category = DB::table('category')->get();
        $image = DB::table('image')->get();
        $product = DB::table('product')
            ->join('colorproduct', 'colorproduct.productid', '=', 'product.idproduct')
            ->join('image', 'image.colorproductid', '=', 'colorproduct.idcolorproduct')
            ->groupBy('product.idproduct')
            ->select('product.title', 'product.price', 'image.url as urlimage', 'product.idproduct', 'product.url')
            ->paginate(9);
        return view('page.shop', [
            'image' => $image,
            'product' => $product,
            'category' => $category

        ]);
    }
    public function showProduct($url)
    {

            $product = DB::table('product')->join('category_products','category_products.productsid','=','product.idproduct')->where('url', '=', $url)->first();
            $category= DB::table('category')->where('idcategory','=',$product->categoryid)->first();
            $color = DB::table('colorproduct')->where('productid', '=', $product->idproduct)->get();
            $size = DB::table('sizeproduct')->where('colorproductid','=',$color[0]->idcolorproduct)->get();
            $image = DB::table('image')->where('colorproductid', '=', $color[0]->idcolorproduct)->get();
            $category_products = DB::table('product')
            ->join('category_products','category_products.productsid','=','product.idproduct')
            ->join('colorproduct', 'colorproduct.productid', '=', 'product.idproduct')
            ->join('image', 'image.colorproductid', '=', 'colorproduct.idcolorproduct')
            ->groupBy('product.idproduct')
            ->select('product.title', 'product.price', 'image.url as urlimage', 'product.idproduct', 'product.url')
            ->where('category_products.categoryid','=',$product->categoryid)
            ->whereNotIn('product.idproduct',[$product->idproduct])
            ->limit(4)
            ->get();
            return view(
                'page.details',
                [
                    'product' => $product,
                    'color' => $color,
                    'size'=>$size,
                    'image' => $image,
                    'categoryproduct'=>$category_products,
                    'category'=>$category,
                ]
            );

    }
    public function Category($url)
    {
        $image = DB::table('image')->get();
        $category = DB::table('category')->get();
        $product = DB::table('category')
            ->join('category_products', 'category_products.categoryid', '=', 'category.idcategory')
            ->join('product', 'product.idproduct', '=', 'category_products.productsid')
            ->join('colorproduct', 'colorproduct.productid', '=', 'product.idproduct')
            ->join('image', 'image.colorproductid', '=', 'colorproduct.idcolorproduct')
            ->groupBy('product.idproduct')
            ->select('product.title', 'product.price', 'image.url as urlimage', 'product.url','product.idproduct')
            ->where('category.url', '=', $url)
            ->paginate(9);

        return view('page.shop', [
            'image' => $image,
            'product' => $product,
            'category' => $category

        ]);
    }
    public function showImage(Request $request)
    {
        $dataimage = DB::table('image')
            ->where('colorproductid', '=', $request->id)
            ->get();
        return view('ajax.image', [
            'image' => $dataimage
            ]);
    }
    public function showSize(Request $request)
    {
        $size = DB::table('sizeproduct')
            ->where('colorproductid', '=', $request->id)
            ->get();
        return view('ajax.size', [
            'size' => $size
            ]);
    }
}
