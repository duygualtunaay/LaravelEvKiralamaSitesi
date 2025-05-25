<?php

namespace App\Http\Controllers;

use App\Models\Category;
use App\Models\House;
use App\Models\Setting;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Storage;

class HouseController extends Controller
{
    public function index()
    {
        $datalist = House::where('user_id', Auth::id())->get();
        return view('home.user_house', ['datalist' => $datalist]);
    }

    public function create()
    {
        $datalist = Category::with('children')->get();
        return view('home.user_house_add', ['datalist' => $datalist]);
    }

    public function store(Request $request)
    {
        $data = new House;

        $data->title = $request->input('title');
        $data->keywords = $request->input('keywords');
        $data->description = $request->input('description');
        $data->address = $request->input('address');
        $data->phone = $request->input('phone');
        $data->metrekare = $request->input('metrekare');
        $data->isitma = $request->input('isitma');
        $data->odasayisi = $request->input('odasayisi');
        $data->katsayisi = $request->input('katsayisi');
        $data->esya = $request->input('esya');
        $data->binayasi = $request->input('binayasi');
        $data->price = $request->input('price');
        $data->aidat = $request->input('aidat');
        $data->category_id = $request->input('category_id');
        $data->user_id = Auth::id();
        $data->detail = $request->input('detail');
        $data->slug = $request->input('slug');
        $data->status = $request->input('status');

        // Yeni eklenen konum alanları
        $data->latitude = $request->input('latitude');
        $data->longitude = $request->input('longitude');

        if ($request->hasFile('image')) {
            $data->image = Storage::putFile('images', $request->file('image'));
        }

        $data->save();

        return redirect()->route('user_houses')->with('success', 'Ev başarıyla eklendi.');
    }

    public function show(House $house)
    {
        //
    }

    public function edit($id)
    {
        $setting = Setting::first();
        $data = House::findOrFail($id);
        $datalist = Category::with('children')->get();
        return view('home.user_house_edit', [
            'data' => $data,
            'datalist' => $datalist,
            'setting' => $setting
        ]);
    }

    public function update(Request $request, House $house, $id)
    {
        $data = House::findOrFail($id);

        $data->title = $request->input('title');
        $data->keywords = $request->input('keywords');
        $data->description = $request->input('description');
        $data->address = $request->input('address');
        $data->phone = $request->input('phone');
        $data->metrekare = $request->input('metrekare');
        $data->isitma = $request->input('isitma');
        $data->odasayisi = $request->input('odasayisi');
        $data->katsayisi = $request->input('katsayisi');
        $data->esya = $request->input('esya');
        $data->binayasi = $request->input('binayasi');
        $data->price = $request->input('price');
        $data->aidat = $request->input('aidat');
        $data->category_id = $request->input('category_id');
        $data->user_id = Auth::id();
        $data->detail = $request->input('detail');
        $data->slug = $request->input('slug');
        $data->status = $request->input('status');

        // Yeni eklenen konum alanları
        $data->latitude = $request->input('latitude');
        $data->longitude = $request->input('longitude');

        if ($request->hasFile('image')) {
            if ($data->image) {
                Storage::delete($data->image);
            }
            $data->image = Storage::putFile('images', $request->file('image'));
        }

        $data->save();

        return redirect()->route('user_houses')->with('success', 'Ev başarıyla güncellendi.');
    }

    public function destroy(House $house, $id)
    {
        DB::table('houses')->where('id', '=', $id)->delete();
        return redirect()->route('user_houses')->with('success', 'Ev silindi.');
    }
}
