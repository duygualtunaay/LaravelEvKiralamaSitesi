@extends('layouts.home')

@php
    $setting = \App\Http\Controllers\HomeController::getsetting();
@endphp

@section('title', 'Referanslarımız | ' . $setting->title)

@include('home._header')

@section('content')

    <!-- Başlık -->
    <section class="intro-single py-5 bg-light">
        <div class="container">
            <div class="row align-items-center">
                <div class="col-md-8">
                    <div class="title-single-box">
                        <h1 class="title-single">Referanslarımız</h1>
                        <p class="text-muted">Müşteri memnuniyetiyle büyüyen portföyümüzden bazı örnekler.</p>
                    </div>
                </div>
            </div>
        </div>
    </section>

    <!-- Referans İçerik -->
    <section class="section-about py-5">
        <div class="container">

            <!-- Üst Görsel -->
            <div class="row mb-5">
                <div class="col-12">
                    <img src="{{ asset('assets/img/slide-about-1.jpg') }}" class="img-fluid rounded shadow-sm" alt="Referans Kapak">
                </div>
            </div>

            <!-- İki Sütunlu İçerik -->
            <div class="row align-items-center">
                <div class="col-md-6 mb-4 mb-md-0">
                    <img src="{{ asset('assets/img/about-2.jpg') }}" class="img-fluid rounded shadow-sm" alt="Referans Görseli">
                </div>
                <div class="col-md-6">
                    <div class="title-box-d">
                        <h3 class="title-d">Referanslarımız</h3>
                    </div>
                    <div class="mt-3">
                        <p class="color-text-a">
                            {!! $setting->references !!}
                        </p>
                    </div>
                </div>
            </div>

        </div>
    </section>

@endsection
