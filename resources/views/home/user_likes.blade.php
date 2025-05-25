@extends('layouts.home')

@php
    $setting = \App\Http\Controllers\HomeController::getsetting();
@endphp

@section('title', 'Favorilerim | ' . $setting->title)

@include('home._header')

@section('content')
    <section class="section-t8">
        <div class="container">

            <!-- Başlık -->
            <div class="row mb-4">
                <div class="col-md-12 text-center">
                    <div class="title-box">
                        <h2 class="title-a">Favorilerim</h2>
                        <p class="text-muted">Kaydettiğiniz ilanları burada bulabilirsiniz.</p>
                    </div>
                </div>
            </div>

            <!-- Favori İlanlar -->
            <div class="row">
                @forelse($datalist as $rs)
                    <div class="col-md-4 mb-4">
                        <div class="card h-100 border-0 shadow-sm">
                            <img src="{{ Storage::url($rs->house->image) }}" class="card-img-top" alt="{{ $rs->house->title }}" style="height: 250px; object-fit: cover;">
                            <div class="card-body d-flex flex-column">
                                <h5 class="card-title text-primary">{{ $rs->house->title }}</h5>
                                <p class="card-text text-muted">{{ Str::limit($rs->house->description, 60) }}</p>
                                <p class="mb-1"><strong>Fiyat:</strong> ₺ {{ number_format($rs->house->price, 0, ',', '.') }}</p>
                                <p class="mb-1"><strong>Oda:</strong> {{ $rs->house->odasayisi }} | <strong>Eşya:</strong> {{ $rs->house->esya }}</p>
                                <div class="mt-auto d-flex justify-content-between">
                                    <a href="{{ route('house', ['id' => $rs->house->id, 'slug' => $rs->house->slug]) }}" class="btn btn-sm btn-outline-primary">Detay</a>

                                    <form action="{{ route('user_like_delete', ['id' => $rs->id]) }}" method="POST" onsubmit="return confirm('Favoriden kaldırmak istiyor musunuz?');">
                                        @csrf
                                        @method('DELETE')
                                        <button type="submit" class="btn btn-sm btn-danger">Sil</button>
                                    </form>
                                </div>
                            </div>
                        </div>
                    </div>
                @empty
                    <div class="col-12 text-center text-muted">
                        <p>Henüz favorilere eklenmiş ilan bulunamadı.</p>
                    </div>
                @endforelse
            </div>

        </div>
    </section>
@endsection
