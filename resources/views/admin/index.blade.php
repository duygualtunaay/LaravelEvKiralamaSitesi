@extends('layouts.admin')

@section('title', 'Admin Paneli Anasayfa')

@section('content')
    <div class="container-fluid">
        <div class="row justify-content-center">
            <div class="col-lg-10">
                <div class="card shadow-lg mt-5">
                    <div class="card-body text-center">
                        <h1 class="display-4 text-primary font-weight-bold mb-4">Admin Paneline Hoş Geldiniz!</h1>
                        <p class="lead text-secondary">Yönetim işlemlerinizi sol menüden gerçekleştirebilirsiniz.</p>
                        <hr>

                    </div>
                </div>
            </div>
        </div>
    </div>

    @include('admin._content')
@endsection
