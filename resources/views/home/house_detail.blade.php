@extends('layouts.home')

@section('title', 'Ev Detayları - ' . $data->title)
@section('description', $data->description)
@section('keywords', $data->description)

@include('home._header')

@section('content')

    <!-- Başlık -->
    <section class="intro-single">
        <div class="container">
            <div class="row">
                <div class="col-md-12 col-lg-8">
                    <div class="title-single-box">
                        @include('home.message')
                        <h1 class="title-single">{{ $data->title }}</h1>
                        <span class="color-text-a">{{ $data->category->title }}</span>
                    </div>
                </div>
            </div>
        </div>
    </section>

    <!-- Galeri + Detaylar -->
    <section class="property-single nav-arrow-b">
        <div class="container">
            <div class="row">

                <!-- Galeri -->
                <div class="col-sm-12 mb-4">
                    <div id="property-single-carousel" class="owl-carousel owl-arrow gallery-property">
                        @foreach($images as $rs)
                            <div class="carousel-item-b">
                                <img src="{{ Storage::url($rs->image) }}" alt="" style="height: 600px; object-fit: cover;">
                            </div>
                        @endforeach
                    </div>
                </div>

                <!-- Sol Sütun -->
                <div class="col-md-5 col-lg-4">

                    <!-- Fiyat -->
                    <div class="property-price d-flex justify-content-center mb-3">
                        <div class="card-header-c d-flex">
                            <div class="card-box-ico"><span class="ion-money">₺</span></div>
                            <div class="card-title-c align-self-center">
                                <h5 class="title-c">{{ number_format($data->price, 0, ',', '.') }}</h5>
                            </div>
                        </div>
                    </div>

                    <!-- Favori Butonu -->
                    <div class="text-center mb-4">
                        <form action="{{ route('like', ['id' => $data->id, 'slug' => $data->slug]) }}" method="post">
                            @csrf
                            <button type="submit" class="btn btn-sm {{ $isFavorited ? 'btn-outline-secondary' : 'btn-outline-danger' }}">
                                {{ $isFavorited ? 'Favoriledin' : 'Favorilere Ekle' }}
                            </button>
                        </form>
                    </div>

                    <!-- Sosyal Paylaşım -->
                    <div class="text-center mb-4">
                        <h6>Bu ilanı paylaş</h6>
                        @php $url = urlencode(request()->fullUrl()); @endphp
                        <div class="d-flex justify-content-center gap-2">
                            <a href="https://www.facebook.com/sharer/sharer.php?u={{ $url }}" target="_blank" class="btn btn-sm btn-primary">Facebook</a>
                            <a href="https://twitter.com/intent/tweet?url={{ $url }}" target="_blank" class="btn btn-sm btn-info">X</a>
                            <a href="https://wa.me/?text={{ $url }}" target="_blank" class="btn btn-sm btn-success">WhatsApp</a>
                        </div>
                    </div>

                    <!-- QR Kod -->
                    <div class="text-center mb-4">
                        <h6>QR Kod ile Paylaş</h6>
                        <img src="https://api.qrserver.com/v1/create-qr-code/?size=150x150&data={{ $url }}" alt="QR Code">
                    </div>

                    <!-- Harita -->
                    @if($data->latitude && $data->longitude)
                        <div class="mb-4">
                            <h5 class="text-center">Konum</h5>
                            <div id="map" style="height: 250px; border: 1px solid #ccc; border-radius: 8px;"></div>
                        </div>
                    @endif

                    <!-- Yorumlar -->
                    <div class="title-box-d mb-3">
                        <h3 class="title-d">Yorumlar</h3>
                    </div>
                    <ul class="list-comments mb-4">
                        @forelse($reviews as $rs)
                            <li class="mb-4 border-bottom pb-3">
                                <div class="comment-details">
                                    <h5 class="comment-author">{{ $rs->user->name }}</h5>
                                    <small class="text-muted">{{ $rs->created_at->format('d.m.Y H:i') }}</small>
                                    <p>{{ $rs->review }}</p>
                                    @auth
                                        @if(Auth::id() === $rs->user_id)

                                            <a href="{{ route('user_review_delete', $rs->id) }}" class="btn btn-sm btn-outline-danger"
                                               onclick="return confirm('Yorumu silmek istediğinizden emin misiniz?')">Sil</a>
                                        @endif
                                    @endauth
                                </div>
                            </li>
                        @empty
                            <p class="text-muted">Henüz yorum yapılmamış.</p>
                        @endforelse
                    </ul>

                    <!-- Yorum Formu -->
                    <div class="title-box-d">
                        <h3 class="title-d">Yorum Yap</h3>
                    </div>
                    <form action="{{ route('sendreview', ['id' => $data->id, 'slug' => $data->slug]) }}" method="post" class="form-a mt-3">
                        @csrf
                        <div class="form-group">
                            <input type="text" name="subject" class="form-control form-control-lg" placeholder="Konu" required>
                        </div>
                        <div class="form-group">
                            <textarea name="review" class="form-control" rows="5" placeholder="Yorumunuzu yazın..." required></textarea>
                        </div>
                        <button type="submit" class="btn btn-primary btn-block">Yorum Yap</button>
                    </form>
                </div>

                <!-- Sağ Sütun -->
                <div class="col-md-7 col-lg-8">
                    <div class="title-box-d mb-3">
                        <h3 class="title-d">Ev Özellikleri</h3>
                    </div>
                    <table class="table table-bordered table-striped">
                        <tbody>
                        <tr><th>Adres</th><td>{{ $data->address }}</td></tr>
                        <tr><th>Telefon</th><td>{{ $data->phone }}</td></tr>
                        <tr><th>Metrekare</th><td>{{ $data->metrekare }} m²</td></tr>
                        <tr><th>Isıtma</th><td>{{ $data->isitma }}</td></tr>
                        <tr><th>Oda Sayısı</th><td>{{ $data->odasayisi }}</td></tr>
                        <tr><th>Kat Sayısı</th><td>{{ $data->katsayisi }}</td></tr>
                        <tr><th>Eşya</th><td>{{ $data->esya }}</td></tr>
                        <tr><th>Bina Yaşı</th><td>{{ $data->binayasi }}</td></tr>
                        <tr><th>Fiyat</th><td>₺ {{ number_format($data->price, 0, ',', '.') }}</td></tr>
                        <tr><th>Aidat</th><td>₺ {{ number_format($data->aidat, 0, ',', '.') }}</td></tr>
                        </tbody>
                    </table>
                </div>

            </div>
        </div>
    </section>

    <!-- Harita -->
    @if($data->latitude && $data->longitude)
        <link rel="stylesheet" href="https://unpkg.com/leaflet/dist/leaflet.css" />
        <script src="https://unpkg.com/leaflet/dist/leaflet.js"></script>
        <script>
            document.addEventListener("DOMContentLoaded", function () {
                const map = L.map('map').setView([{{ $data->latitude }}, {{ $data->longitude }}], 15);
                L.tileLayer('https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png', {
                    attribution: '&copy; OpenStreetMap'
                }).addTo(map);
                L.marker([{{ $data->latitude }}, {{ $data->longitude }}]).addTo(map)
                    .bindPopup("<b>{{ $data->title }}</b>").openPopup();
            });
        </script>
    @endif

    <!-- Benzer İlanlar Carousel -->
    @if(isset($related) && count($related) > 0)
        <section class="section-t8 mt-5">
            <div class="container">
                <div class="title-box-d mb-4 text-center">
                    <h3 class="title-d">Benzer İlanlar</h3>
                </div>
                <div id="related-carousel" class="owl-carousel owl-theme">
                    @foreach($related as $item)
                        <div class="carousel-item-b">
                            <div class="card-box-a card-shadow">
                                <div class="img-box-a">
                                    <img src="{{ Storage::url($item->image) }}" class="img-a img-fluid" style="height: 350px; object-fit: cover;" alt="{{ $item->title }}">
                                </div>
                                <div class="card-overlay">
                                    <div class="card-overlay-a-content">
                                        <div class="card-header-a">
                                            <h2 class="card-title-a">
                                                <a href="{{ route('house', ['id' => $item->id, 'slug' => $item->slug]) }}">{{ $item->title }}</a>
                                            </h2>
                                        </div>
                                        <div class="card-body-a">
                                            <div class="price-box d-flex">
                                                <span class="price-a">₺ {{ number_format($item->price, 0, ',', '.') }}</span>
                                            </div>
                                            <a href="{{ route('house', ['id' => $item->id, 'slug' => $item->slug]) }}" class="link-a">İncele <span class="ion-ios-arrow-forward"></span></a>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    @endforeach
                </div>
            </div>
        </section>

        <script>
            document.addEventListener("DOMContentLoaded", function () {
                $('#related-carousel').owlCarousel({
                    loop: true,
                    margin: 20,
                    nav: true,
                    dots: false,
                    autoplay: true,
                    autoplayTimeout: 5000,
                    responsive: {
                        0: { items: 1 },
                        768: { items: 2 },
                        992: { items: 3 }
                    }
                });
            });
        </script>
    @endif

@endsection
