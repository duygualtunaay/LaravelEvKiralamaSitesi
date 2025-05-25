@extends('layouts.admin')

@section('title','Kategoriler Listesi')

@section('content')
    <div class="container-fluid mt-4">
        <div class="row justify-content-center">
            <div class="col-lg-12">
                <div class="card shadow">

                    {{-- Header --}}
                    <div class="card-header bg-info text-white d-flex justify-content-between align-items-center">
                        <h5 class="mb-0">Kategori Listesi (Toplam: {{ $datalist->total() }})</h5>
                        <a href="{{ route('admin_category_add') }}" class="btn btn-light btn-sm">
                            <i class="fas fa-plus-circle"></i> Kategori Ekle
                        </a>
                    </div>

                    {{-- Arama --}}
                    <div class="card-body pb-0">
                        <form method="GET" action="{{ route('admin_category') }}" class="form-inline mb-3 float-right">
                            <input type="text" name="search" class="form-control form-control-sm mr-2" placeholder="Kategori ara..." value="{{ request()->search }}">
                            <button type="submit" class="btn btn-sm btn-primary"><i class="fas fa-search"></i> Ara</button>
                        </form>
                    </div>

                    {{-- Tablo --}}
                    <div class="card-body pt-0">
                        <div class="table-responsive">
                            <table class="table table-bordered table-hover text-center">
                                <thead class="thead-light">
                                <tr>
                                    <th>#</th>
                                    <th>Üst Kategori</th>
                                    <th>Başlık</th>
                                    <th>Durum</th>
                                    <th>Düzenle</th>
                                    <th>Sil</th>
                                </tr>
                                </thead>
                                <tbody>
                                @foreach($datalist as $rs)
                                    <tr>
                                        <td>{{ $rs->id }}</td>
                                        <td>{{ \App\Http\Controllers\Admin\CategoryController::getParentsTree($rs, $rs->title) }}</td>
                                        <td>{{ $rs->title }}</td>
                                        <td>
                                        <span class="badge {{ $rs->status == 'true' ? 'badge-success' : 'badge-danger' }}">
                                            {{ $rs->status == 'true' ? 'Aktif' : 'Pasif' }}
                                        </span>
                                        </td>
                                        <td>
                                            <a href="{{ route('admin_category_edit', ['id' => $rs->id]) }}" class="btn btn-sm btn-warning" title="Düzenle">
                                                <i class="fas fa-edit"></i>
                                            </a>
                                        </td>
                                        <td>
                                            <button onclick="confirmDelete({{ $rs->id }})" class="btn btn-sm btn-danger" title="Sil">
                                                <i class="fas fa-trash-alt"></i>
                                            </button>
                                            <form id="delete-form-{{ $rs->id }}" action="{{ route('admin_category_delete', ['id' => $rs->id]) }}" method="POST" style="display: none;">
                                                @csrf
                                                @method('GET')
                                            </form>
                                        </td>
                                    </tr>
                                @endforeach
                                </tbody>
                            </table>

                            {{-- Sayfalama --}}
                            <div class="d-flex justify-content-center mt-3">
                                {{ $datalist->appends(['search' => request()->search])->links() }}
                            </div>
                        </div>
                    </div>

                </div>
            </div>
        </div>
    </div>

    {{-- SweetAlert CDN --}}
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>

    {{-- SweetAlert Silme Fonksiyonu --}}
    <script>
        function confirmDelete(id) {
            Swal.fire({
                title: 'Emin misiniz?',
                text: "Bu kategoriyi silmek üzeresiniz!",
                icon: 'warning',
                showCancelButton: true,
                confirmButtonColor: '#e3342f',
                cancelButtonColor: '#6c757d',
                confirmButtonText: 'Evet, sil!',
                cancelButtonText: 'İptal'
            }).then((result) => {
                if (result.isConfirmed) {
                    document.getElementById('delete-form-' + id).submit();
                }
            });
        }
    </script>
@endsection
