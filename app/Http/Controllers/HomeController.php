<?php

namespace App\Http\Controllers;

use App\Models\Category;
use App\Models\Faq;
use App\Models\House;
use App\Models\Image;
use App\Models\Likes;
use App\Models\Message;
use App\Models\Review;
use App\Models\Setting;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;

class HomeController extends Controller
{
    public static function categoryList()
    {
        return Category::where('parent_id', 0)
            ->where('status', 'true')
            ->with(['children' => function ($query) {
                $query->where('status', 'true');
            }])
            ->get();
    }


    public static function getSetting()
    {
        return Setting::first();
    }

    public function index()
    {
        $setting = self::getSetting();
        $slider = House::select('id', 'title', 'image', 'slug', 'category_id', 'metrekare', 'phone', 'odasayisi', 'address', 'price')
            ->where('status', 'True')->limit(4)->get();
        $daily = House::select('id', 'title', 'image', 'slug','price', 'category_id')
            ->where('status', 'True')->inRandomOrder()->limit(8)->get();
        $last = House::select('id', 'title', 'image', 'slug', 'price', 'category_id')
            ->where('status', 'True')->orderByDesc('id')->limit(8)->get();
        $picked = House::select('id', 'title', 'image', 'slug', 'price', 'category_id')
            ->where('status', 'True')->inRandomOrder()->limit(8)->get();

        return view('home.index', compact('setting', 'daily', 'last', 'picked', 'slider'));
    }
    public function search(Request $request)
    {
        $setting = self::getSetting();
        $query = \App\Models\House::where('status', 'true');

        if ($request->filled('keyword')) {
            $query->where('title', 'like', '%' . $request->keyword . '%');
        }

        if ($request->filled('min_price')) {
            $query->where('price', '>=', $request->min_price);
        }

        if ($request->filled('max_price')) {
            $query->where('price', '<=', $request->max_price);
        }

        if ($request->filled('odasayisi')) {
            $query->where('odasayisi', $request->odasayisi);
        }

        $results = $query->orderBy('created_at', 'desc')->get();

        return view('home.search_houses', compact('results','setting'));
    }



    public function categoryhouses(Request $request, $id)
    {
        $setting = self::getSetting();
        $data = Category::findOrFail($id);

        $query = House::where('category_id', $id)->where('status', 'true');

        // Filtreler
        if ($request->filled('keyword')) {
            $query->where('title', 'like', '%' . $request->keyword . '%');
        }
        if ($request->filled('min_price')) {
            $query->where('price', '>=', $request->min_price);
        }
        if ($request->filled('max_price')) {
            $query->where('price', '<=', $request->max_price);
        }
        if ($request->filled('odasayisi')) {
            $query->where('odasayisi', $request->odasayisi);
        }
        if ($request->filled('esya')) {
            $query->where('esya', $request->esya);
        }

        $datalist = $query->get();

        $suggestedQuery = House::where('category_id', $data->id)
            ->where('status', 'true')
            ->whereNotIn('id', $datalist->pluck('id'));

        if ($request->filled('odasayisi')) {
            $suggestedQuery->where('odasayisi', $request->odasayisi);
        }
        if ($request->filled('esya')) {
            $suggestedQuery->where('esya', $request->esya);
        }

        $suggested = $suggestedQuery->take(3)->get();

        return view('home.category_houses', compact('data', 'datalist', 'setting', 'suggested'));
    }




    public function house($id)
    {

        $setting = self::getSetting();
        $data = House::findOrFail($id);
        $isFavorited = Auth::user()->likes()->where('house_id', $data->id)->exists();
        $images = Image::where('house_id', $id)->get();
        $reviews = Review::where('house_id', $id)->get();
        return view('home.house_detail', compact('setting', 'data', 'images', 'reviews','isFavorited'));
    }

    public function sendreview(Request $request, $id, $slug)
    {
        $request->validate([
            'subject' => 'required|string|max:255',
            'review' => 'required|string',
        ]);

        Review::create([
            'user_id' => Auth::id(),
            'house_id' => $id,
            'subject' => $request->subject,
            'review' => $request->review,
            'IP' => $request->ip(),
        ]);

        return redirect()->route('house', ['id' => $id,'slug'=>$slug])->with('success', 'Mesajınız kaydedilmiştir');
    }

    public function like(Request $request, $id, $slug)
    {
        // Kullanıcının aynı evi daha önce like'layıp like'lamadığını kontrol et
        $alreadyLiked = Likes::where('user_id', Auth::id())
            ->where('house_id', $id)
            ->exists();

        if ($alreadyLiked) {
            return redirect()->route('house', ['id' => $id, 'slug' => $slug])
                ->with('info', 'Bu evi zaten favorilediniz.');
        }

        // Daha önce like'lanmamışsa yeni kayıt oluştur
        Likes::create([
            'user_id' => Auth::id(),
            'house_id' => $id,
            'likes' => true,
        ]);

        return redirect()->route('house', ['id' => $id, 'slug' => $slug])
            ->with('success', 'Favorilediniz');
    }

    public function sendmessage(Request $request)
    {
        $request->validate([
            'name' => 'required|string|max:255',
            'email' => 'required|email|max:255',
            'phone' => 'nullable|string|max:20',
            'subject' => 'required|string|max:255',
            'message' => 'required|string',
        ]);

        Message::create($request->all());

        return redirect()->route('contact')->with('success', 'Mesajınız kaydedilmiştir');
    }

    public function aboutus()
    {
        $setting = self::getSetting();
        return view('home.about', compact('setting'));
    }

    public function contact()
    {
        $setting = self::getSetting();
        return view('home.contact', compact('setting'));
    }

    public function references()
    {
        $setting = self::getSetting();
        return view('home.references', compact('setting'));
    }

    public function faq()
    {
        $setting = self::getSetting();
        $datalist = Faq::orderBy('position')->get();
        return view('home.faq', compact('datalist', 'setting'));
    }

    public function login()
    {
        return view('admin.login');
    }

    public function logincheck(Request $request)
    {
        $credentials = $request->validate([
            'email' => 'required|email',
            'password' => 'required|string|min:6',
        ]);

        if (Auth::attempt($credentials)) {
            $request->session()->regenerate();
            return redirect()->intended('admin');
        }

        return back()->withErrors(['email' => 'The provided credentials do not match our records.']);
    }

    public function logout(Request $request)
    {
        Auth::logout();
        $request->session()->invalidate();
        $request->session()->regenerateToken();
        return redirect('/');
    }
}
