<!DOCTYPE html>
<html lang="tr">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Kullanıcı Rolleri - {{$data->name}}</title>
    <link rel="stylesheet" href="{{asset('assets')}}/admin/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
</head>
<body class="bg-light">

<div class="container mt-5">
    <div class="card shadow">
        <div class="card-header bg-secondary text-white d-flex justify-content-between align-items-center">
            <h5 class="mb-0">Kullanıcı: {{ $data->name }}</h5>
        </div>

        <div class="card-body">

            <div class="mb-3">
                <table class="table table-bordered">
                    <tr>
                        <th style="width: 200px;">ID</th>
                        <td>{{ $data->id }}</td>
                    </tr>
                    <tr>
                        <th>İsim</th>
                        <td>{{ $data->name }}</td>
                    </tr>
                    <tr>
                        <th>Email</th>
                        <td>{{ $data->email }}</td>
                    </tr>
                    <tr>
                        <th>Roller</th>
                        <td>
                            <table class="table table-sm table-hover table-striped mb-0">
                                <thead class="thead-light">
                                <tr>
                                    <th>Rol Adı</th>
                                    <th>İşlem</th>
                                </tr>
                                </thead>
                                <tbody>
                                @foreach($data->roles as $row)
                                    <tr>
                                        <td>{{ $row->name }}</td>
                                        <td>
                                            <a href="{{ route('admin_user_role_delete', ['userid' => $data->id, 'roleid' => $row->id]) }}"
                                               onclick="return confirm('Silmek istediğinizden emin misiniz?')"
                                               class="btn btn-sm btn-danger">
                                                <i class="fas fa-trash-alt"></i> Sil
                                            </a>
                                        </td>
                                    </tr>
                                @endforeach
                                </tbody>
                            </table>
                        </td>
                    </tr>

                    <tr>
                        <th>Rol Ekle</th>
                        <td>
                            <form action="{{ route('admin_user_role_add', ['id' => $data->id]) }}" method="POST" class="form-inline">
                                @csrf
                                <div class="form-group mr-2">
                                    <select name="roleid" class="form-control">
                                        @foreach($datalist as $rs)
                                            <option value="{{ $rs->id }}">{{ $rs->name }}</option>
                                        @endforeach
                                    </select>
                                </div>
                                <button type="submit" class="btn btn-success">
                                    <i class="fas fa-plus-circle"></i> Rol Ekle
                                </button>
                            </form>
                        </td>
                    </tr>
                </table>
            </div>

        </div>
    </div>
</div>

<script src="{{asset('assets')}}/admin/js/core/jquery.min.js"></script>
<script src="{{asset('assets')}}/admin/js/core/bootstrap.min.js"></script>
</body>
</html>
