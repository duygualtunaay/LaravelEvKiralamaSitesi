<?php

namespace App\Http\Controllers;

use App\Models\Likes;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;

class LikesController extends Controller
{
    public function index()
    {
        $datalist=Likes::where('user_id',Auth::id())->get();
        return view('home.user_likes',['datalist'=>$datalist]);
    }

    public function destroy(Likes $likes,$id)
    {
        $data=Likes::find($id);
        $data->delete();
        return redirect()->back()->with('success','Favorilerden kaldırıldı!');

    }
}
