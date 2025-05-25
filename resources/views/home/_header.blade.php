

<!-- Navbar Start -->
<nav class="navbar navbar-default navbar-trans navbar-expand-lg fixed-top">
    <div class="container">
        <!-- Toggler -->
        <button class="navbar-toggler collapsed" type="button" data-toggle="collapse" data-target="#navbarDefault"
                aria-controls="navbarDefault" aria-expanded="false" aria-label="Toggle navigation">
            <span></span>
            <span></span>
            <span></span>
        </button>
        <!-- Brand -->
        <a class="navbar-brand" href="/">
            <img src="{{ asset('assets/img/logo.png') }}" alt="Duygu House United" style="height: 70px;">
        </a>

        <!-- Mobile Search Button -->
        <button type="button" class="btn btn-link nav-search navbar-toggle-box-collapse d-md-none" data-toggle="collapse"
                data-target="#navbarTogglerDemo01" aria-expanded="false">
            <span class="fa fa-search" aria-hidden="true"></span>
        </button>

        <!-- Navbar Links -->
        <div class="navbar-collapse collapse justify-content-center" id="navbarDefault">
            <ul class="navbar-nav">

                <!-- Anasayfa -->
                <li class="nav-item">
                    <a class="nav-link active" href="{{ route('home') }}">Anasayfa</a>
                </li>

                <!-- Kategoriler -->
                @php
                    $parentCategories = \App\Http\Controllers\HomeController::categoryList();
                @endphp
                <li class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown"
                       aria-haspopup="true" aria-expanded="false">
                        Kategoriler
                    </a>
                    <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                        @foreach($parentCategories as $rs)
                            <a class="dropdown-item" href="{{ route('categoryhouses', ['id' => $rs->id, 'slug' => $rs->slug]) }}">
                                {{ $rs->title }}
                            </a>
                        @endforeach
                    </div>
                </li>

                <!-- Kullanıcı Menüsü -->
                @auth
                    <li class="nav-item dropdown">
                        <a class="nav-link dropdown-toggle" href="#" id="navbarDropdownUser" role="button" data-toggle="dropdown">
                            {{ Auth::user()->name }}
                        </a>
                        <div class="dropdown-menu">
                            <a class="dropdown-item" href="{{ route('userprofile') }}">Profilim</a>
                            <a class="dropdown-item" href="{{ route('user_review') }}">Yorumlarım</a>
                            <a class="dropdown-item" href="{{ route('user_likes') }}">Favorilerim</a>
                            <a class="dropdown-item" href="{{ route('user_houses') }}">İlanlarım</a>
                            <a class="dropdown-item" href="{{ route('logout') }}">Çıkış</a>
                        </div>
                    </li>
                @else
                    <!-- Giriş & Kayıt -->
                    <li class="nav-item dropdown">
                        <a class="nav-link dropdown-toggle" href="#" id="navbarDropdownLogin" role="button" data-toggle="dropdown">
                            Giriş & Katıl
                        </a>
                        <div class="dropdown-menu">
                            <a class="dropdown-item" href="/login">Giriş Yap</a>
                            <a class="dropdown-item" href="/register">Kaydol</a>
                        </div>
                    </li>
                @endauth

            </ul>
        </div>
    </div>
</nav>
<!-- Navbar End -->
