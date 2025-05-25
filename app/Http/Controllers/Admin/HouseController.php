<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use App\Models\Category;
use App\Models\House;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Storage;

class HouseController extends Controller
{
    public function index(Request $request)
    {
        $query = House::with('category');

        if ($request->filled('search')) {
            $query->where('title', 'like', '%' . $request->search . '%');
        }

        $datalist = $query->orderBy('id', 'desc')->paginate(10);

        return view('admin.house', compact('datalist'));
    }

    public function create()
    {
        $datalist = Category::with('children')->get();
        return view('admin.house_add', ['datalist' => $datalist]);
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

        // 🗺️ Latitude ve Longitude eklendi
        $data->latitude = $request->input('latitude');
        $data->longitude = $request->input('longitude');

        if ($request->hasFile('image')) {
            $data->image = $request->file('image')->store('images', 'public');
        }

        $data->save();

        return redirect()->route('admin_houses');
    }

    public function show(House $house)
    {
        //
    }

    public function edit(House $house, $id)
    {
        $data = House::findOrFail($id);
        $datalist = Category::with('children')->get();
        return view('admin.house_edit', ['data' => $data, 'datalist' => $datalist]);
    }

    public function update(Request $request, $id)
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
        $data->detail = $request->input('detail');
        $data->slug = $request->input('slug');
        $data->status = $request->input('status');

        // 🗺️ Latitude ve Longitude güncellemesi
        $data->latitude = $request->input('latitude');
        $data->longitude = $request->input('longitude');

        if ($request->hasFile('image')) {
            if ($data->image) {
                Storage::delete($data->image);
            }
            $data->image = Storage::putFile('images', $request->file('image'));
        }

        $data->save();

        return redirect()->route('admin_houses');
    }

    public function destroy(House $house, $id)
    {
        DB::table('houses')->where('id', '=', $id)->delete();
        return redirect()->route('admin_houses');
    }
}
