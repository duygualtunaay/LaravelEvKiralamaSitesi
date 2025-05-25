@extends('layouts.admin')

@section('title','Sıkça Sorulan Sorular')

@section('content')
    <div class="container-fluid mt-4">
        <div class="row justify-content-center">
            <div class="col-lg-12">
                <div class="card shadow">

                    {{-- Başlık ve Ekle Butonu --}}
                    <div class="card-header bg-info text-white d-flex justify-content-between align-items-center">
                        <h5 class="mb-0">Sıkça Sorulan Sorular</h5>
                        <a href="{{ route('admin_faq_add') }}" class="btn btn-light btn-sm">
                            <i class="fas fa-plus-circle"></i> Yeni Soru Ekle
                        </a>
                    </div>

                    {{-- Mesaj Alanı --}}
                    <div class="card-body">
                        @include('home.message')

                        {{-- Tablo --}}
                        <div class="table-responsive">
                            <table class="table table-bordered table-hover text-center align-middle">
                                <thead class="thead-light">
                                <tr>
                                    <th>ID</th>
                                    <th>Pozisyon</th>
                                    <th>Soru</th>
                                    <th>Cevap</th>
                                    <th>Durum</th>
                                    <th>Düzenle</th>
                                    <th>Sil</th>
                                </tr>
                                </thead>
                                <tbody>
                                @foreach($datalist as $rs)
                                    <tr>
                                        <td>{{ $rs->id }}</td>
                                        <td>{{ $rs->position }}</td>
                                        <td>{{ $rs->question }}</td>
                                        <td>{!! Str::limit($rs->answer, 100) !!}</td>
                                        <td>
                                        <span class="badge {{ $rs->status == 'true' ? 'badge-success' : 'badge-secondary' }}">
                                            {{ $rs->status == 'true' ? 'Aktif' : 'Pasif' }}
                                        </span>
                                        </td>
                                        <td>
                                            <a href="{{ route('admin_faq_edit', ['id' => $rs->id]) }}" class="btn btn-sm btn-warning" title="Düzenle">
                                                <i class="fas fa-edit"></i>
                                            </a>
                                        </td>
                                        <td>
                                            <a href="{{ route('admin_faq_delete', ['id' => $rs->id]) }}"
                                               onclick="return confirm('Bu kaydı silmek istediğinize emin misiniz?')"
                                               class="btn btn-sm btn-danger" title="Sil">
                                                <i class="fas fa-trash-alt"></i>
                                            </a>
                                        </td>
                                    </tr>
                                @endforeach

                                @if($datalist->isEmpty())
                                    <tr><td colspan="7">Kayıt bulunamadı.</td></tr>
                                @endif
                                </tbody>
                            </table>


                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
@endsection
