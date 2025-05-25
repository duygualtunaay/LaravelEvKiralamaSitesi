@extends('layouts.admin')

@section('title', 'Kategori Ekle')

@section('content')
    <div class="container-fluid">
        <div class="row justify-content-center">
            <div class="col-lg-8">
                <div class="card shadow mb-4">
                    <div class="card-header bg-info text-white">
                        <h4 class="mb-0">Yeni Kategori Ekle</h4>
                    </div>
                    <div class="card-body">
                        <form action="{{ route('admin_category_create') }}" method="POST">
                            @csrf

                            {{-- Parent Category --}}
                            <div class="form-group">
                                <label for="parent_id">Üst Kategori</label>
                                <select name="parent_id" id="parent_id" class="form-control">
                                    <option value="0" selected>Ana Kategori</option>
                                    @foreach($datalist as $rs)
                                        <option value="{{ $rs->id }}">
                                            {{ \App\Http\Controllers\Admin\CategoryController::getParentsTree($rs, $rs->title) }}
                                        </option>
                                    @endforeach
                                </select>
                            </div>

                            {{-- Title --}}
                            <div class="form-group">
                                <label for="title">Başlık</label>
                                <input type="text" name="title" id="title" class="form-control" placeholder="Kategori Başlığı">
                            </div>

                            {{-- Keywords --}}
                            <div class="form-group">
                                <label for="keywords">Anahtar Kelimeler</label>
                                <input type="text" name="keywords" id="keywords" class="form-control" placeholder="Anahtar Kelimeler">
                            </div>

                            {{-- Description --}}
                            <div class="form-group">
                                <label for="description">Açıklama</label>
                                <input type="text" name="description" id="description" class="form-control" placeholder="Açıklama">
                            </div>

                            {{-- Slug --}}
                            <div class="form-group">
                                <label for="slug">Slug</label>
                                <input type="text" name="slug" id="slug" class="form-control" placeholder="slug">
                            </div>

                            {{-- Status --}}
                            <div class="form-group">
                                <label for="status">Durum</label>
                                <select name="status" id="status" class="form-control">
                                    <option value="true">Aktif</option>
                                    <option value="false">Pasif</option>
                                </select>
                            </div>

                            {{-- Submit Button --}}
                            <button type="submit" class="btn btn-success btn-block">Kategori Ekle</button>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
@endsection
