<!DOCTYPE html>
<html lang="tr">
<head>
    <meta charset="UTF-8">
    <title>Resim Galerisi</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <!-- CSS -->
    <link href="{{ asset('assets/admin/css/bootstrap.min.css') }}" rel="stylesheet">
    <link href="{{ asset('assets/admin/css/now-ui-dashboard.css?v=1.5.0') }}" rel="stylesheet">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css" rel="stylesheet">

    <!-- Favicon -->
    <link rel="apple-touch-icon" sizes="76x76" href="{{ asset('assets/admin/img/apple-icon.png') }}">
    <link rel="icon" type="image/png" href="{{ asset('assets/admin/img/favicon.png') }}">
</head>

<body>
<div class="container mt-5">
    <div class="card shadow-lg">
        <div class="card-header bg-info text-white d-flex justify-content-between align-items-center">
            <h5 class="mb-0">Galeri - Ev: <strong>{{ $data->title }}</strong></h5>
        </div>

        <div class="card-body">
            {{-- Resim Ekleme Formu --}}
            <form action="{{ route('admin_image_store', ['house_id' => $data->id]) }}" method="POST" enctype="multipart/form-data" class="mb-4">
                @csrf
                <div class="form-group">
                    <label for="images">Resim(ler) Seç</label>
                    <input type="file" name="images[]" id="images" class="form-control-file" multiple>
                </div>
                <button type="submit" class="btn btn-success">
                    <i class="fas fa-plus-circle"></i> Yükle
                </button>
            </form>


            {{-- Resim Tablosu --}}
            <div class="table-responsive">
                <table class="table table-bordered table-hover text-center align-middle">
                    <thead class="thead-light">
                    <tr>
                        <th>ID</th>
                        <th>Başlık</th>
                        <th>Resim</th>
                        <th>İşlem</th>
                    </tr>
                    </thead>
                    <tbody>
                    @foreach($images as $rs)
                        <tr>
                            <td>{{ $rs->id }}</td>
                            <td>{{ $rs->title }}</td>
                            <td>
                                @if($rs->image)
                                    <img src="{{ Storage::url($rs->image) }}" height="60" width="100" class="rounded">
                                @endif
                            </td>
                            <td>
                                <a href="{{ route('admin_image_delete', ['id' => $rs->id, 'house_id' => $data->id]) }}"
                                   onclick="return confirm('Bu resmi silmek istediğinize emin misiniz?')"
                                   class="btn btn-sm btn-danger">
                                    <i class="fas fa-trash-alt"></i> Sil
                                </a>
                            </td>
                        </tr>
                    @endforeach

                    @if($images->isEmpty())
                        <tr>
                            <td colspan="4">Henüz resim eklenmedi.</td>
                        </tr>
                    @endif
                    </tbody>
                </table>
            </div>
        </div>
    </div>
</div>

<!-- Scripts -->
<script src="{{ asset('assets/admin/js/core/jquery.min.js') }}"></script>
<script src="{{ asset('assets/admin/js/core/bootstrap.min.js') }}"></script>
</body>
</html>
