@extends('layouts.home')

@section('title', 'Arama Sonuçları')

@include('home._header')

@section('content')
    <section class="section-property section-t8">
        <div class="container">

            <!-- Başlık -->
            <div class="row mb-4">
                <div class="col-md-12 text-center">
                    <div class="title-box">
                        <h2 class="title-a">Arama Sonuçları</h2>
                        <p class="text-muted">Filtrenize uygun ilanlar listeleniyor.</p>
                    </div>
                </div>
            </div>

            <!-- Filtreleme Formu -->
            <form method="GET" action="{{ route('search_houses') }}" class="mb-5">
                <div class="row justify-content-center align-items-end">
                    <div class="col-md-3 mb-2">
                        <input type="text" name="keyword" class="form-control" placeholder="Anahtar kelime" value="{{ request()->keyword }}">
                    </div>

                    <div class="col-md-2 mb-2">
                        <input type="number" name="min_price" class="form-control" placeholder="Min ₺" value="{{ request()->min_price }}">
                    </div>

                    <div class="col-md-2 mb-2">
                        <input type="number" name="max_price" class="form-control" placeholder="Max ₺" value="{{ request()->max_price }}">
                    </div>

                    <div class="col-md-2 mb-2">
                        <select name="odasayisi" class="form-control">
                            <option value="">Oda Sayısı</option>
                            <option value="1" {{ request()->odasayisi == '1' ? 'selected' : '' }}>1+1</option>
                            <option value="2" {{ request()->odasayisi == '2' ? 'selected' : '' }}>2+1</option>
                            <option value="3" {{ request()->odasayisi == '3' ? 'selected' : '' }}>3+1</option>
                            <option value="4" {{ request()->odasayisi == '4' ? 'selected' : '' }}>4+1</option>
                        </select>
                    </div>

                    <div class="col-md-2 mb-2">
                        <select name="esya" class="form-control">
                            <option value="">Eşya Durumu</option>
                            <option value="Eşyalı" {{ request()->esya == 'Eşyalı' ? 'selected' : '' }}>Eşyalı</option>
                            <option value="Eşyasız" {{ request()->esya == 'Eşyasız' ? 'selected' : '' }}>Eşyasız</option>
                        </select>
                    </div>

                    <div class="col-md-1 mb-2 text-right">
                        <button type="submit" class="btn btn-primary btn-block">Filtrele</button>
                    </div>
                </div>
            </form>

            <!-- Sonuçlar -->
            <div class="row">
                @forelse($results as $rs)
                    <div class="col-md-4 mb-4">
                        <div class="card-box-a card-shadow">
                            <div class="img-box-a">
                                <img src="{{ Storage::url($rs->image) }}" alt="{{ $rs->title }}" class="img-a img-fluid" style="height: 300px; object-fit: cover;">
                            </div>
                            <div class="card-overlay">
                                <div class="card-overlay-a-content">
                                    <div class="card-header-a">
                                        <h2 class="card-title-a">
                                            <a href="{{ route('house', ['id' => $rs->id, 'slug' => $rs->slug]) }}">{{ $rs->title }}</a>
                                        </h2>
                                    </div>
                                    <div class="card-body-a">
                                        <div class="price-box d-flex justify-content-start">
                                            <span class="price-a">₺ {{ number_format($rs->price, 0, ',', '.') }}</span>
                                        </div>
                                        <a href="{{ route('house', ['id' => $rs->id, 'slug' => $rs->slug]) }}" class="link-a">
                                            İncele <span class="ion-ios-arrow-forward"></span>
                                        </a>
                                    </div>
                                    <div class="card-footer-a">
                                        <ul class="card-info d-flex justify-content-between">
                                            <li>
                                                <h4 class="card-info-title">Kategori</h4>
                                                <span>{{ \App\Http\Controllers\Admin\CategoryController::getParentsTree($rs->category, $rs->category->title) }}</span>
                                            </li>
                                            <li>
                                                <h4 class="card-info-title">Oda</h4>
                                                <span>{{ $rs->odasayisi }}</span>
                                            </li>
                                            <li>
                                                <h4 class="card-info-title">Eşya</h4>
                                                <span>{{ $rs->esya }}</span>
                                            </li>
                                        </ul>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                @empty
                    <div class="col-12 text-center">
                        <p class="text-muted">Bu filtrelere uygun ilan bulunamadı.</p>
                    </div>
                @endforelse
            </div>

        </div>
    </section>
@endsection
