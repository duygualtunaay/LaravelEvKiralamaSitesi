@extends('layouts.admin')

@section('title', 'Kiralık Ev Ekle')

@section('javascript')
    @FilemanagerScript
    <script src="https://cdn.ckeditor.com/4.14.0/standard/ckeditor.js"></script>
@endsection

@section('content')
    <div class="container-fluid">
        <div class="row justify-content-center">
            <div class="col-lg-10">
                <div class="card shadow mb-4">
                    <div class="card-header bg-success text-white">
                        <h4 class="mb-0">Yeni Kiralık Ev Ekle</h4>
                    </div>
                    <div class="card-body">
                        <form action="{{ route('admin_house_store') }}" method="POST" enctype="multipart/form-data">
                            @csrf

                            {{-- Kategori --}}
                            <div class="form-group">
                                <label for="category_id">Kategori</label>
                                <select name="category_id" id="category_id" class="form-control">
                                    <option value="0">Ana Mekan</option>
                                    @foreach($datalist as $rs)
                                        <option value="{{ $rs->id }}">
                                            {{ \App\Http\Controllers\Admin\CategoryController::getParentsTree($rs, $rs->title) }}
                                        </option>
                                    @endforeach
                                </select>
                            </div>

                            {{-- Başlık --}}
                            <div class="form-group">
                                <label for="title">Başlık</label>
                                <input type="text" name="title" id="title" class="form-control" placeholder="Başlık">
                            </div>

                            {{-- SEO --}}
                            <div class="form-group">
                                <label for="keywords">Anahtar Kelimeler</label>
                                <input type="text" name="keywords" id="keywords" class="form-control" placeholder="Anahtar Kelimeler">
                            </div>

                            <div class="form-group">
                                <label for="description">Açıklama</label>
                                <input type="text" name="description" id="description" class="form-control" placeholder="Açıklama">
                            </div>

                            {{-- Adres --}}
                            <div class="form-group">
                                <label for="address">Adres</label>
                                <input type="text" name="address" id="address" class="form-control" placeholder="Adres">
                            </div>

                            {{-- Telefon --}}
                            <div class="form-group">
                                <label for="phone">Telefon</label>
                                <input type="number" name="phone" id="phone" class="form-control" placeholder="Telefon">
                            </div>

                            {{-- Metrekare & Bina Yaşı --}}
                            <div class="form-row">
                                <div class="form-group col-md-6">
                                    <label for="metrekare">Metrekare</label>
                                    <input type="number" name="metrekare" id="metrekare" class="form-control" placeholder="Metrekare">
                                </div>
                                <div class="form-group col-md-6">
                                    <label for="binayasi">Bina Yaşı</label>
                                    <input type="number" name="binayasi" id="binayasi" class="form-control" placeholder="Bina Yaşı">
                                </div>
                            </div>

                            {{-- Oda Sayısı, Kat Sayısı, Eşya --}}
                            <div class="form-row">
                                <div class="form-group col-md-4">
                                    <label for="odasayisi">Oda Sayısı</label>
                                    <input type="number" name="odasayisi" id="odasayisi" class="form-control" placeholder="Oda Sayısı">
                                </div>
                                <div class="form-group col-md-4">
                                    <label for="katsayisi">Kat Sayısı</label>
                                    <input type="number" name="katsayisi" id="katsayisi" class="form-control" placeholder="Kat Sayısı">
                                </div>
                                <div class="form-group col-md-4">
                                    <label for="esya">Eşya</label>
                                    <input type="text" name="esya" id="esya" class="form-control" placeholder="Eşya Durumu (Eşyalı / Eşyasız)">
                                </div>
                            </div>

                            {{-- Isıtma --}}
                            <div class="form-group">
                                <label for="isitma">Isıtma Türü</label>
                                <input type="text" name="isitma" id="isitma" class="form-control" placeholder="Örn: Kombi, Merkezi">
                            </div>

                            {{-- Fiyat & Aidat --}}
                            <div class="form-row">
                                <div class="form-group col-md-6">
                                    <label for="price">Fiyat (₺)</label>
                                    <input type="number" name="price" id="price" class="form-control" placeholder="Fiyat">
                                </div>
                                <div class="form-group col-md-6">
                                    <label for="aidat">Aidat (₺)</label>
                                    <input type="number" name="aidat" id="aidat" class="form-control" placeholder="Aidat">
                                </div>
                            </div>

                            {{-- Konum --}}
                            <div class="form-row">
                                <div class="form-group col-md-6">
                                    <label for="latitude">Latitude (Enlem)</label>
                                    <input type="text" name="latitude" id="latitude" class="form-control" placeholder="41.1234567">
                                </div>
                                <div class="form-group col-md-6">
                                    <label for="longitude">Longitude (Boylam)</label>
                                    <input type="text" name="longitude" id="longitude" class="form-control" placeholder="29.1234567">
                                </div>
                            </div>

                            {{-- Detay --}}
                            <div class="form-group">
                                <label for="detail">Detay</label>
                                <textarea name="detail" id="detail" class="form-control" rows="5"></textarea>
                            </div>

                            {{-- Slug --}}
                            <div class="form-group">
                                <label for="slug">Slug</label>
                                <input type="text" name="slug" id="slug" class="form-control" placeholder="seo-url">
                            </div>

                            {{-- Resim --}}
                            <div class="form-group">
                                <label for="image">Resim</label>
                                <input type="file" name="image" id="image" class="form-control-file">
                            </div>

                            {{-- Durum --}}
                            <div class="form-group">
                                <label for="status">Durum</label>
                                <select name="status" id="status" class="form-control">
                                    <option value="true">Aktif</option>
                                    <option value="false">Pasif</option>
                                </select>
                            </div>

                            {{-- Gönder Butonu --}}
                            <button type="submit" class="btn btn-success btn-block">Evi Ekle</button>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>

    {{-- CKEditor --}}
    <script>
        window.onload = function () {
            CKEDITOR.replace('detail', {
                filebrowserBrowseUrl: filemanager.ckBrowseUrl,
            });
        };
    </script>
@endsection
