@extends('layouts.admin')

@section('title','Kiralık Ev Düzenle')

@section('javascript')
    @FilemanagerScript
    <script src="https://cdn.ckeditor.com/4.14.0/standard/ckeditor.js"></script>
@endsection

@section('content')
    <div class="container-fluid">
        <div class="row justify-content-center">
            <div class="col-lg-10">
                <div class="card shadow mb-4">
                    <div class="card-header bg-primary text-white">
                        <h4 class="mb-0">Kiralık Ev Düzenle</h4>
                    </div>
                    <div class="card-body">
                        <form action="{{ route('admin_house_update', ['id' => $data->id]) }}" method="POST" enctype="multipart/form-data">
                            @csrf

                            {{-- Kategori --}}
                            <div class="form-group">
                                <label for="category_id">Kategori</label>
                                <select name="category_id" id="category_id" class="form-control">
                                    @foreach($datalist as $rs)
                                        <option value="{{ $rs->id }}" @if($rs->id == $data->category_id) selected @endif>
                                            {{ \App\Http\Controllers\Admin\CategoryController::getParentsTree($rs, $rs->title) }}
                                        </option>
                                    @endforeach
                                </select>
                            </div>

                            {{-- Başlık, Anahtar Kelime, Açıklama --}}
                            <div class="form-group">
                                <label for="title">Başlık</label>
                                <input type="text" name="title" id="title" value="{{ $data->title }}" class="form-control">
                            </div>

                            <div class="form-group">
                                <label for="keywords">Anahtar Kelimeler</label>
                                <input type="text" name="keywords" id="keywords" value="{{ $data->keywords }}" class="form-control">
                            </div>

                            <div class="form-group">
                                <label for="description">Açıklama</label>
                                <input type="text" name="description" id="description" value="{{ $data->description }}" class="form-control">
                            </div>

                            {{-- Adres, Telefon --}}
                            <div class="form-group">
                                <label for="address">Adres</label>
                                <input type="text" name="address" id="address" value="{{ $data->address }}" class="form-control">
                            </div>

                            <div class="form-group">
                                <label for="phone">Telefon</label>
                                <input type="number" name="phone" id="phone" value="{{ $data->phone }}" class="form-control">
                            </div>

                            {{-- Metrekare, Bina Yaşı --}}
                            <div class="form-row">
                                <div class="form-group col-md-6">
                                    <label for="metrekare">Metrekare</label>
                                    <input type="number" name="metrekare" id="metrekare" value="{{ $data->metrekare }}" class="form-control">
                                </div>
                                <div class="form-group col-md-6">
                                    <label for="binayasi">Bina Yaşı</label>
                                    <input type="number" name="binayasi" id="binayasi" value="{{ $data->binayasi }}" class="form-control">
                                </div>
                            </div>

                            {{-- Oda, Kat, Eşya --}}
                            <div class="form-row">
                                <div class="form-group col-md-4">
                                    <label for="odasayisi">Oda Sayısı</label>
                                    <input type="number" name="odasayisi" id="odasayisi" value="{{ $data->odasayisi }}" class="form-control">
                                </div>
                                <div class="form-group col-md-4">
                                    <label for="katsayisi">Kat Sayısı</label>
                                    <input type="number" name="katsayisi" id="katsayisi" value="{{ $data->katsayisi }}" class="form-control">
                                </div>
                                <div class="form-group col-md-4">
                                    <label for="esya">Eşya</label>
                                    <input type="text" name="esya" id="esya" value="{{ $data->esya }}" class="form-control">
                                </div>
                            </div>

                            {{-- Isıtma --}}
                            <div class="form-group">
                                <label for="isitma">Isıtma Türü</label>
                                <input type="text" name="isitma" id="isitma" value="{{ $data->isitma }}" class="form-control">
                            </div>

                            {{-- Fiyat, Aidat --}}
                            <div class="form-row">
                                <div class="form-group col-md-6">
                                    <label for="price">Fiyat (₺)</label>
                                    <input type="number" name="price" id="price" value="{{ $data->price }}" class="form-control">
                                </div>
                                <div class="form-group col-md-6">
                                    <label for="aidat">Aidat (₺)</label>
                                    <input type="number" name="aidat" id="aidat" value="{{ $data->aidat }}" class="form-control">
                                </div>
                            </div>

                            {{-- Konum --}}
                            <div class="form-row">
                                <div class="form-group col-md-6">
                                    <label for="latitude">Latitude (Enlem)</label>
                                    <input type="text" name="latitude" id="latitude" value="{{ $data->latitude }}" class="form-control" placeholder="41.xxxxxx">
                                </div>
                                <div class="form-group col-md-6">
                                    <label for="longitude">Longitude (Boylam)</label>
                                    <input type="text" name="longitude" id="longitude" value="{{ $data->longitude }}" class="form-control" placeholder="28.xxxxxx">
                                </div>
                            </div>

                            {{-- Detay --}}
                            <div class="form-group">
                                <label for="detail">Detay</label>
                                <textarea name="detail" id="detail" class="form-control" rows="5">{{ $data->detail }}</textarea>
                            </div>

                            {{-- Slug --}}
                            <div class="form-group">
                                <label for="slug">Slug</label>
                                <input type="text" name="slug" id="slug" value="{{ $data->slug }}" class="form-control">
                            </div>

                            {{-- Resim --}}
                            <div class="form-group">
                                <label for="image">Resim</label>
                                <input type="file" name="image" id="image" class="form-control-file">
                                @if($data->image)
                                    <br>
                                    <img src="{{ Storage::url($data->image) }}" height="100" alt="Mevcut Resim">
                                @endif
                            </div>

                            {{-- Durum --}}
                            <div class="form-group">
                                <label for="status">Durum</label>
                                <select name="status" id="status" class="form-control">
                                    <option selected>{{ $data->status }}</option>
                                    <option value="true">Aktif</option>
                                    <option value="false">Pasif</option>
                                </select>
                            </div>

                            {{-- Submit --}}
                            <button type="submit" class="btn btn-success btn-block">Güncelle</button>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <script>
        window.onload = function () {
            CKEDITOR.replace('detail', {
                filebrowserBrowseUrl: filemanager.ckBrowseUrl,
            });
        };
    </script>
@endsection
