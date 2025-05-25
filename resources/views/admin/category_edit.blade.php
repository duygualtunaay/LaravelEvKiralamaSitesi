@extends('layouts.admin')

@section('title', 'Kategoriyi Düzenle')

@section('content')
    <div class="container-fluid">
        <div class="row justify-content-center">
            <div class="col-lg-8">
                <div class="card shadow mb-4">
                    <div class="card-header bg-warning text-dark">
                        <h4 class="mb-0">Kategoriyi Düzenle</h4>
                    </div>
                    <div class="card-body">
                        <form action="{{ route('admin_category_update', ['id' => $data->id]) }}" method="POST">
                            @csrf

                            {{-- Parent Category --}}
                            <div class="form-group">
                                <label for="parent_id">Üst Kategori</label>
                                <select name="parent_id" id="parent_id" class="form-control">
                                    <option value="0">Ana Kategori</option>
                                    @foreach($datalist as $rs)
                                        <option value="{{ $rs->id }}" @if($rs->id == $data->parent_id) selected @endif>
                                            {{ \App\Http\Controllers\Admin\CategoryController::getParentsTree($rs, $rs->title) }}
                                        </option>
                                    @endforeach
                                </select>
                            </div>

                            {{-- Title --}}
                            <div class="form-group">
                                <label for="title">Başlık</label>
                                <input type="text" name="title" id="title" value="{{ $data->title }}" class="form-control" placeholder="Kategori Başlığı">
                            </div>

                            {{-- Keywords --}}
                            <div class="form-group">
                                <label for="keywords">Anahtar Kelimeler</label>
                                <input type="text" name="keywords" id="keywords" value="{{ $data->keywords }}" class="form-control" placeholder="Anahtar Kelimeler">
                            </div>

                            {{-- Description --}}
                            <div class="form-group">
                                <label for="description">Açıklama</label>
                                <input type="text" name="description" id="description" value="{{ $data->description }}" class="form-control" placeholder="Açıklama">
                            </div>

                            {{-- Slug --}}
                            <div class="form-group">
                                <label for="slug">Slug</label>
                                <input type="text" name="slug" id="slug" value="{{ $data->slug }}" class="form-control" placeholder="Slug">
                            </div>

                            {{-- Status --}}
                            <div class="form-group">
                                <label for="status">Durum</label>
                                <select name="status" id="status" class="form-control">
                                    <option value="true" @if($data->status == 'true') selected @endif>Aktif</option>
                                    <option value="false" @if($data->status == 'false') selected @endif>Pasif</option>
                                </select>
                            </div>

                            {{-- Submit --}}
                            <button type="submit" class="btn btn-success btn-block" onclick="return confirm('Kategoriyi güncellemek istediğinize emin misiniz?')">Güncelle</button>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
@endsection
