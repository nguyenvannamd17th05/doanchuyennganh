<?php

namespace App\Http\Controllers\user;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\DB;

class CheckoutController extends Controller
{
    //
    public function index()
    {
        if (Session('Cart')) {

            return view('page.checkout');
        } else {
            return redirect('/');
        }
    }
    public function checkout(Request $request)
    {

        $sum = 0;
        $Cart = Session('Cart') ?? NULL;
        if ($Cart != NULL) {
            $id = DB::table('invoice')->insertGetId([
                'userid' => Auth::user()->id,
                'address' => $request->diachi,
                'phonenumber' => $request->sodienthoai,
            ]);
            DB::beginTransaction();
            foreach ($Cart as $value) {
                $sum += $value['price'] * $value['Amount'];
                DB::table('invoicedetails')
                    ->insert([
                        'amount' => $value['Amount'],
                        'invoiceid' => $id,
                        'productinfoId' => $value['Titleproduct'],
                        'productIdproduct' => $value['idproduct']
                    ]);
                $size = DB::table("sizeproduct")->where('idcolorproduct', '=', $value['idsize'])->first();
                if ($size->amount - $value['Amount'] < 0) {
                    DB::rollback();
                }
                DB::table('sizeproduct')->update(['amount' => $size->amount - $value['Amount']]);
            }
            DB::table('invoice')->update(['totalmoney' => $sum]);
            DB::commit();
            $request->session()->forget('Cart');
            return redirect('/');
        } else {
            return redirect()->back();
        }
    }
}
