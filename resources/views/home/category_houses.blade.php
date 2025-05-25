@extends('layouts.home')

@section('title', 'Ev Kategorileri | ' . $data->title)

@include('home._header')

@section('content')
    <section class="section-property section-t8">
        <div class="container">

            <!-- Sayfa Başlığı -->
            <div class="row mb-4">
                <div class="col-md-12 text-center">
                    <div class="title-box">
                        <h2 class="title-a">{{ $data->title }}</h2>
                        <p class="text-muted">Kategoriye ait ilanları inceleyin.</p>
                    </div>
                </div>
            </div>

            <!-- Filtre Formu -->
            <form method="GET" action="{{ route('categoryhouses', ['id' => $data->id, 'slug' => $data->slug]) }}" class="mb-5">
                <div class="row g-2 justify-content-center">
                    <div class="col-md-3">
                        <input type="text" name="keyword" class="form-control" placeholder="Anahtar kelime" value="{{ request()->keyword }}">
                    </div>
                    <div class="col-md-2">
                        <input type="number" name="min_price" class="form-control" placeholder="Min ₺" value="{{ request()->min_price }}">
                    </div>
                    <div class="col-md-2">
                        <input type="number" name="max_price" class="form-control" placeholder="Max ₺" value="{{ request()->max_price }}">
                    </div>
                    <div class="col-md-2">
                        <select name="odasayisi" class="form-control">
                            <option value="">Oda Sayısı</option>
                            @for ($i = 1; $i <= 4; $i++)
                                <option value="{{ $i }}" {{ request()->odasayisi == $i ? 'selected' : '' }}>{{ $i }}+1</option>
                            @endfor
                        </select>
                    </div>
                    <div class="col-md-2">
                        <select name="esya" class="form-control">
                            <option value="">Eşya Durumu</option>
                            <option value="Eşyalı" {{ request()->esya == 'Eşyalı' ? 'selected' : '' }}>Eşyalı</option>
                            <option value="Eşyasız" {{ request()->esya == 'Eşyasız' ? 'selected' : '' }}>Eşyasız</option>
                        </select>
                    </div>
                    <div class="col-md-1">
                        <button type="submit" class="btn btn-primary w-100">Filtrele</button>
                    </div>
                </div>
            </form>

            <!-- Sonuçlar -->
            <div class="row">
                @forelse($datalist as $rs)
                    <div class="col-md-4 mb-4">
                        <div class="card h-100 shadow-sm border-0">
                            <img src="{{ Storage::url($rs->image) }}" class="card-img-top" alt="{{ $rs->title }}" style="height: 250px; object-fit: cover;">
                            <div class="card-body">
                                <h5 class="card-title text-primary">{{ $rs->title }}</h5>
                                <p class="card-text text-muted">{{ Str::limit($rs->description, 60) }}</p>
                                <p class="mb-1"><strong>Fiyat:</strong> ₺ {{ number_format($rs->price, 0, ',', '.') }}</p>
                                <p class="mb-1"><strong>Oda:</strong> {{ $rs->odasayisi }} | <strong>Eşya:</strong> {{ $rs->esya }}</p>
                                <a href="{{ route('house', ['id' => $rs->id, 'slug' => $rs->slug]) }}" class="btn btn-sm btn-outline-primary mt-2">Detay</a>
                            </div>
                        </div>
                    </div>
                @empty
                    <div class="col-12 text-center text-muted">
                        <p>Bu filtrelere uygun ilan bulunamadı.</p>
                    </div>
                @endforelse
            </div>

            <!-- Önerilen İlanlar -->
            @if(isset($suggested) && $suggested->count())
                <hr class="my-5">
                <div class="row mb-4">
                    <div class="col-md-12 text-center">
                        <h3 class="title-a">Benzer Öneriler</h3>
                        <p class="text-muted">Filtrenize benzer diğer ilanlar</p>
                    </div>
                </div>

                <div class="row">
                    @foreach($suggested as $item)
                        <div class="col-md-4 mb-4">
                            <div class="card h-100 shadow-sm border">
                                <img src="{{ Storage::url($item->image) }}" class="card-img-top" style="height: 230px; object-fit: cover;" alt="{{ $item->title }}">
                                <div class="card-body">
                                    <h5 class="card-title">{{ $item->title }}</h5>
                                    <p class="text-muted mb-1">{{ Str::limit($item->description, 50) }}</p>
                                    <p><strong>₺ {{ number_format($item->price, 0, ',', '.') }}</strong></p>
                                    <a href="{{ route('house', ['id' => $item->id, 'slug' => $item->slug]) }}" class="btn btn-sm btn-primary">İncele</a>
                                </div>
                            </div>
                        </div>
                    @endforeach
                </div>
            @endif

        </div>
    </section>
@endsection
