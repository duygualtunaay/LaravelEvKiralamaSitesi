@extends('layouts.admin')

@section('title','Kiralık Evler Listesi')

@section('content')
    <div class="container-fluid mt-4">
        <div class="row justify-content-center">
            <div class="col-lg-12">
                <div class="card shadow">

                    {{-- Header --}}
                    <div class="card-header bg-dark text-white d-flex justify-content-between align-items-center">
                        <h4 class="mb-0">Kiralık Evler (Toplam: {{ $datalist->total() }})</h4>
                        <a href="{{ route('admin_house_create') }}" class="btn btn-success btn-sm">
                            <i class="fas fa-plus-circle"></i> Kiralık Ev Ekle
                        </a>
                    </div>

                    {{-- Arama --}}
                    <div class="card-body pb-0">
                        <form method="GET" action="{{ route('admin_houses') }}" class="form-inline mb-3 float-right">
                            <input type="text" name="search" class="form-control form-control-sm mr-2" placeholder="Başlığa göre ara..." value="{{ request()->search }}">
                            <button type="submit" class="btn btn-sm btn-primary"><i class="fas fa-search"></i> Ara</button>
                        </form>
                    </div>

                    {{-- Tablo --}}
                    <div class="card-body pt-0">
                        <div class="table-responsive">
                            <table class="table table-bordered table-hover text-center align-middle">
                                <thead class="thead-light">
                                <tr>
                                    <th>ID</th>
                                    <th>Kategori</th>
                                    <th>Başlık</th>
                                    <th>Resim</th>
                                    <th>Galeri</th>
                                    <th>Oda</th>
                                    <th>m²</th>
                                    <th>Fiyat</th>
                                    <th>Durum</th>
                                    <th>Düzenle</th>
                                    <th>Sil</th>
                                </tr>
                                </thead>
                                <tbody>
                                @foreach($datalist as $rs)
                                    <tr>
                                        <td>{{ $rs->id }}</td>
                                        <td>{{ \App\Http\Controllers\Admin\CategoryController::getParentsTree($rs->category, $rs->category->title) }}</td>
                                        <td>{{ $rs->title }}</td>
                                        <td>
                                            @if($rs->image)
                                                <img src="{{ Storage::url($rs->image) }}" height="60" width="100" class="rounded">
                                            @endif
                                        </td>
                                        <td>
                                            <a href="{{ route('admin_image_add', ['house_id' => $rs->id]) }}"
                                               onclick="return !window.open(this.href,'','top=50 left=100 width=1100,height=700')"
                                               class="btn btn-sm btn-outline-secondary" title="Galeri">
                                                <i class="fas fa-images"></i>
                                            </a>
                                        </td>
                                        <td>{{ $rs->odasayisi }}</td>
                                        <td>{{ $rs->metrekare }}</td>
                                        <td>{{ $rs->price }} ₺</td>
                                        <td>
                                        <span class="badge {{ $rs->status === 'true' ? 'badge-success' : 'badge-danger' }}">
                                            {{ $rs->status === 'true' ? 'Aktif' : 'Pasif' }}
                                        </span>
                                        </td>
                                        <td>
                                            <a href="{{ route('admin_house_edit', ['id' => $rs->id]) }}" class="btn btn-sm btn-warning" title="Düzenle">
                                                <i class="fas fa-edit"></i>
                                            </a>
                                        </td>
                                        <td>
                                            <button onclick="confirmDelete({{ $rs->id }})" class="btn btn-sm btn-danger" title="Sil">
                                                <i class="fas fa-trash-alt"></i>
                                            </button>
                                            <form id="delete-form-{{ $rs->id }}" action="{{ route('admin_house_delete', ['id' => $rs->id]) }}" method="POST" style="display: none;">
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

    {{-- SweetAlert --}}
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
    <script>
        function confirmDelete(id) {
            Swal.fire({
                title: 'Emin misiniz?',
                text: "Bu evi silmek üzeresiniz!",
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
