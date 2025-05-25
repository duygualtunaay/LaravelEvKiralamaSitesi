@extends('layouts.home')

@section('title', 'Ana Sayfa | ' . $setting->title)
@section('description')
@endsection

@include('home._header')
@include('home._slider')

@section('content')

    <!-- Arama Filtresi -->
    <section class="py-4 bg-light border-bottom">
        <div class="container">
            <form action="{{ route('search_houses') }}" method="GET">
                <div class="row g-3 align-items-end">
                    <div class="col-md-3">
                        <label for="keyword">Başlık</label>
                        <input type="text" name="keyword" id="keyword" class="form-control" placeholder="Örn: Bahçeli daire">
                    </div>

                    <div class="col-md-2">
                        <label for="min_price">Min Fiyat</label>
                        <input type="number" name="min_price" id="min_price" class="form-control">
                    </div>

                    <div class="col-md-2">
                        <label for="max_price">Max Fiyat</label>
                        <input type="number" name="max_price" id="max_price" class="form-control">
                    </div>

                    <div class="col-md-2">
                        <label for="odasayisi">Oda</label>
                        <select name="odasayisi" id="odasayisi" class="form-control">
                            <option value="">Tümü</option>
                            <option value="1">1+1</option>
                            <option value="2">2+1</option>
                            <option value="3">3+1</option>
                            <option value="4">4+1</option>
                        </select>
                    </div>

                    <div class="col-md-3 text-end">
                        <button type="submit" class="btn btn-primary mt-3 w-100">Filtrele</button>
                    </div>
                </div>
            </form>
        </div>
    </section>


    <!-- En Son Eklenen İlanlar -->
    <section class="section-property section-t8">
        <div class="container">
            <div class="row mb-4">
                <div class="col-md-12 text-center">
                    <div class="title-box">
                        <h2 class="title-a">En Son Eklenen İlanlar</h2>
                        <p class="text-muted">Sitemize yeni eklenen ilanları aşağıdan keşfedin</p>
                    </div>
                </div>
            </div>

            <div id="property-carousel" class="owl-carousel owl-theme">
                @foreach($last as $rs)
                    <div class="carousel-item-b">
                        <div class="card-box-a card-shadow">
                            <div class="img-box-a">
                                <img src="{{ Storage::url($rs->image) }}" alt="{{ $rs->title }}" class="img-a img-fluid" style="height: 400px; object-fit: cover;">
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
                                            <li><h4 class="card-info-title">Kategori</h4><span>{{ \App\Http\Controllers\Admin\CategoryController::getParentsTree($rs->category, $rs->category->title) }}</span></li>
                                            <li><h4 class="card-info-title">Fiyat</h4><span>₺ {{ number_format($rs->price, 0, ',', '.') }}</span></li>
                                        </ul>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                @endforeach
            </div>
        </div>
    </section>

    <!-- Rastgele İlanlar -->
    <section class="section-news section-t8 bg-light mt-5">
        <div class="container">
            <div class="row mb-4">
                <div class="col-md-12 text-center">
                    <div class="title-box">
                        <h2 class="title-a">Rastgele İlanlar</h2>
                        <p class="text-muted">Farklı kategorilerden bazı seçilmiş ilanlar</p>
                    </div>
                </div>
            </div>

            <div id="new-carousel" class="owl-carousel owl-theme">
                @foreach($picked as $rs)
                    <div class="carousel-item-c">
                        <div class="card-box-b card-shadow news-box">
                            <div class="img-box-b">
                                <img src="{{ Storage::url($rs->image) }}" alt="{{ $rs->title }}" class="img-b img-fluid" style="height: 400px; object-fit: cover;">
                            </div>
                            <div class="card-overlay">
                                <div class="card-header-b">
                                    <div class="card-category-b">
                                        <a href="{{ route('house', ['id' => $rs->id, 'slug' => $rs->slug]) }}" class="category-b">
                                            {{ \App\Http\Controllers\Admin\CategoryController::getParentsTree($rs->category, $rs->category->title) }}
                                        </a>
                                    </div>
                                    <div class="card-title-b">
                                        <h2 class="title-2">
                                            <a href="{{ route('house', ['id' => $rs->id, 'slug' => $rs->slug]) }}">{{ $rs->title }}</a>
                                        </h2>
                                    </div>
                                    <div class="card-date">
                                        <span class="date-b">₺ {{ number_format($rs->price, 0, ',', '.') }}</span>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                @endforeach
            </div>
        </div>
    </section>
    <!-- En Son Eklenen İlanlar -->
    <section class="section-property section-t8">
        <div class="container">
            <div class="row mb-4">
                <div class="col-md-12 text-center">
                    <div class="title-box">
                        <h2 class="title-a">Size Özel İlanlar</h2>
                        <p class="text-muted">Sitemizde size özel ilanları aşağıdan keşfedin</p>
                    </div>
                </div>
            </div>

            <div id="property-carousel" class="owl-carousel owl-theme">
                @foreach($daily as $rs)
                    <div class="carousel-item-b">
                        <div class="card-box-a card-shadow">
                            <div class="img-box-a">
                                <img src="{{ Storage::url($rs->image) }}" alt="{{ $rs->title }}" class="img-a img-fluid" style="height: 400px; object-fit: cover;">
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
                                            <li><h4 class="card-info-title">Kategori</h4><span>{{ \App\Http\Controllers\Admin\CategoryController::getParentsTree($rs->category, $rs->category->title) }}</span></li>
                                            <li><h4 class="card-info-title">Fiyat</h4><span>₺ {{ number_format($rs->price, 0, ',', '.') }}</span></li>
                                        </ul>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                @endforeach
            </div>
        </div>
    </section>
    <!-- OwlCarousel Aktifleştirme -->
    <script>
        document.addEventListener("DOMContentLoaded", function () {
            $('#property-carousel, #new-carousel').owlCarousel({
                loop: true,
                margin: 20,
                nav: true,
                dots: true,
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
    <!-- WhatsApp Butonu (sol alt) -->
    <a href="https://wa.me/905462665761?text=Merhaba%2C%20Duygu%20House%20United%27tan%20bilgi%20almak%20istiyorum." target="_blank" style="
    position: fixed;
    bottom: 20px;
    left: 20px;
    z-index: 9999;
    background-color: #25d366;
    color: white;
    padding: 12px 16px;
    border-radius: 50%;
    font-size: 24px;
    box-shadow: 0 4px 10px rgba(0,0,0,0.3);
">
        <i class="fa fa-whatsapp"></i>
    </a>


    <!--Start of Tawk.to Script-->
    <script type="text/javascript">
        var Tawk_API=Tawk_API||{}, Tawk_LoadStart=new Date();
        (function(){
            var s1=document.createElement("script"),s0=document.getElementsByTagName("script")[0];
            s1.async=true;
            s1.src='https://embed.tawk.to/6832ef133fcf7d191b44c880/1is3fbp08';
            s1.charset='UTF-8';
            s1.setAttribute('crossorigin','*');
            s0.parentNode.insertBefore(s1,s0);
        })();
    </script>
    <!--End of Tawk.to Script-->

    <!-- ÇEREZ BİLDİRİMİ -->
    <div id="cookieConsent" class="bg-dark text-white p-3 position-fixed w-100" style="bottom:0; left:0; z-index:9999; display:none;">
        <div class="container d-flex justify-content-between align-items-center">
            <span>Bu site, kullanıcı deneyiminizi iyileştirmek için çerezler kullanır.</span>
            <button class="btn btn-sm btn-light" onclick="acceptCookies()">Anladım</button>
        </div>
    </div>

    <script>
        function acceptCookies() {
            localStorage.setItem('cookieAccepted', 'true');
            document.getElementById('cookieConsent').style.display = 'none';
        }

        document.addEventListener("DOMContentLoaded", function () {
            if (!localStorage.getItem('cookieAccepted')) {
                document.getElementById('cookieConsent').style.display = 'block';
            }
        });
    </script>


@endsection
