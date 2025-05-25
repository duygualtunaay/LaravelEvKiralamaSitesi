@extends('layouts.admin')

@section('title', 'User Listesi')

@section('content')
    <div class="container-fluid">
        <div class="row justify-content-center">
            <div class="col-lg-12">
                <div class="card shadow mb-4">
                    <div class="card-header bg-dark text-white d-flex justify-content-between align-items-center">
                        <h4 class="mb-0">Kullanıcı Listesi</h4>
                        @include('home.message')
                    </div>
                    <div class="card-body">
                        <div class="table-responsive">
                            <table class="table table-hover table-bordered align-middle text-center">
                                <thead class="thead-light">
                                <tr>
                                    <th>#</th>
                                    <th>Profil</th>
                                    <th>İsim</th>
                                    <th>Email</th>
                                    <th>Telefon</th>
                                    <th>Adres</th>
                                    <th>Roller</th>
                                    <th colspan="2">İşlemler</th>
                                </tr>
                                </thead>
                                <tbody>
                                @foreach($datalist as $rs)
                                    <tr>
                                        <td>{{ $rs->id }}</td>
                                        <td>
                                            @if($rs->profile_photo_path)
                                                <img src="{{ Storage::url($rs->profile_photo_path) }}" height="50" class="rounded-circle">
                                            @else
                                                <img src="{{ asset('assets/admin/images/default-user.png') }}" height="50" class="rounded-circle">
                                            @endif
                                        </td>
                                        <td>{{ $rs->name }}</td>
                                        <td>{{ $rs->email }}</td>
                                        <td>{{ $rs->phone }}</td>
                                        <td>{{ $rs->address }}</td>
                                        <td>
                                            @foreach($rs->roles as $role)
                                                <span class="badge badge-primary">{{ $role->name }}</span>
                                            @endforeach
                                            <a href="{{ route('admin_user_roles', ['id' => $rs->id]) }}"
                                               class="btn btn-sm btn-outline-success ml-2"
                                               title="Rol Ekle"
                                               onclick="return !window.open(this.href,'','top=50 left=100 width=1100,height=700')">
                                                <i class="fa fa-plus-circle"></i>
                                            </a>
                                        </td>
                                        <td>
                                            <a href="{{ route('admin_user_edit', ['id' => $rs->id]) }}" class="btn btn-sm btn-warning" title="Düzenle">
                                                <i class="fa fa-edit"></i>
                                            </a>
                                        </td>
                                        <td>
                                            <a href="{{ route('admin_user_delete', ['id' => $rs->id]) }}"
                                               onclick="return confirm('Silmek istediğinizden emin misiniz?')"
                                               class="btn btn-sm btn-danger" title="Sil">
                                                <i class="fa fa-trash"></i>
                                            </a>
                                        </td>
                                    </tr>
                                @endforeach
                                </tbody>
                            </table>

                            {{-- Sayfalama eklemek istersen burada olabilir --}}
                            {{-- {{ $datalist->links() }} --}}
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
@endsection
