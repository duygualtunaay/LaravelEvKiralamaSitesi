@extends('layouts.admin')

@section('title','FAQ Düzenle')

@section('javascript')
    @FilemanagerScript
    <script src="https://cdn.ckeditor.com/4.14.0/standard/ckeditor.js"></script>
@endsection

@section('content')
    <div class="container-fluid mt-4">
        <div class="row justify-content-center">
            <div class="col-lg-8">
                <div class="card shadow">
                    <div class="card-header bg-warning text-white">
                        <h5 class="mb-0">Sıkça Sorulan Soruyu Düzenle</h5>
                    </div>
                    <div class="card-body">
                        <form action="{{ route('admin_faq_update', ['id' => $data->id]) }}" method="POST">
                            @csrf

                            <div class="form-group">
                                <label for="position">Sıra</label>
                                <input type="number" name="position" id="position" class="form-control" value="{{ $data->position }}" placeholder="Pozisyon numarası">
                            </div>

                            <div class="form-group">
                                <label for="question">Soru</label>
                                <input type="text" name="question" id="question" class="form-control" value="{{ $data->question }}" placeholder="Soru metni">
                            </div>

                            <div class="form-group">
                                <label for="answer">Cevap</label>
                                <textarea name="answer" id="answer" class="form-control" rows="6">{!! $data->answer !!}</textarea>
                            </div>

                            <div class="form-group">
                                <label for="status">Durum</label>
                                <select name="status" id="status" class="form-control">
                                    <option value="true" @if($data->status == 'true') selected @endif>Aktif</option>
                                    <option value="false" @if($data->status == 'false') selected @endif>Pasif</option>
                                </select>
                            </div>

                            <button type="submit" class="btn btn-success btn-block">Güncelle</button>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <script>
        window.onload = function () {
            CKEDITOR.replace('answer', {
                filebrowserBrowseUrl: filemanager.ckBrowseUrl,
            });
        };
    </script>
@endsection
