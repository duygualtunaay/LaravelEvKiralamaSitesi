@extends('layouts.home')

@php
    $setting = \App\Http\Controllers\HomeController::getsetting();
@endphp

@section('title', 'Yorumlarım | ' . $setting->title)

@include('home._header')

@section('content')
    <section class="section-t8">
        <div class="container">

            <!-- Başlık -->
            <div class="row mb-4">
                <div class="col-md-12 text-center">
                    <div class="title-box">
                        <h2 class="title-a">Yorumlarım</h2>
                        <p class="text-muted">Yorum yaptığınız ilanları burada görebilirsiniz.</p>
                    </div>
                </div>
            </div>

            <!-- Yorumlar -->
            <div class="row">
                @forelse($datalist as $rs)
                    <div class="col-md-6 mb-4">
                        <div class="card shadow-sm h-100 border-0">
                            <div class="row g-0">
                                <div class="col-md-4">
                                    <img src="{{ Storage::url($rs->house->image) }}" class="img-fluid rounded-start h-100" style="object-fit: cover;" alt="{{ $rs->house->title }}">
                                </div>
                                <div class="col-md-8">
                                    <div class="card-body d-flex flex-column">
                                        <h5 class="card-title">{{ $rs->house->title }}</h5>
                                        <p class="card-text mb-2">{{ $rs->review }}</p>
                                        <p class="card-text"><small class="text-muted">{{ $rs->created_at->format('d.m.Y H:i') }}</small></p>
                                        <span class="badge bg-primary align-self-start">{{ $rs->subject }}</span>
                                        <a href="{{ route('house', ['id' => $rs->house->id, 'slug' => $rs->house->slug]) }}" class="btn btn-sm btn-outline-primary mt-auto">İlana Git</a>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                @empty
                    <div class="col-12 text-center text-muted">
                        <p>Henüz yorum yapmadınız.</p>
                    </div>
                @endforelse
            </div>

        </div>
    </section>
@endsection
