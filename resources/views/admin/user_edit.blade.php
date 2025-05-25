@extends('layouts.admin')

@section('title', 'Kullanıcı Düzenle')

@section('content')
    <div class="container-fluid">
        <div class="row justify-content-center">
            <div class="col-lg-8">
                <div class="card shadow mb-4">
                    <div class="card-header bg-primary text-white">
                        <h4 class="mb-0">Kullanıcı Bilgilerini Düzenle</h4>
                    </div>
                    <div class="card-body">
                        <form action="{{ route('admin_user_update', ['id' => $data->id]) }}" method="POST" enctype="multipart/form-data">
                            @csrf

                            {{-- Name --}}
                            <div class="form-group">
                                <label for="name">İsim</label>
                                <input type="text" name="name" id="name" value="{{ $data->name }}" class="form-control" placeholder="İsim">
                            </div>

                            {{-- Email --}}
                            <div class="form-group">
                                <label for="email">E-posta</label>
                                <input type="text" name="email" id="email" value="{{ $data->email }}" class="form-control" placeholder="E-posta">
                            </div>

                            {{-- Phone --}}
                            <div class="form-group">
                                <label for="phone">Telefon</label>
                                <input type="text" name="phone" id="phone" value="{{ $data->phone }}" class="form-control" placeholder="Telefon">
                            </div>

                            {{-- Address --}}
                            <div class="form-group">
                                <label for="address">Adres</label>
                                <input type="text" name="address" id="address" value="{{ $data->address }}" class="form-control" placeholder="Adres">
                            </div>

                            {{-- Profile Image --}}
                            <div class="form-group">
                                <label for="image">Profil Resmi</label>
                                <input type="file" name="image" id="image" class="form-control-file">
                                @if($data->profile_photo_path)
                                    <div class="mt-3">
                                        <img src="{{ Storage::url($data->profile_photo_path) }}" height="150" class="rounded shadow-sm">
                                    </div>
                                @endif
                            </div>

                            {{-- Submit Button --}}
                            <button type="submit" class="btn btn-success btn-block mt-4">Kaydet</button>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
@endsection
