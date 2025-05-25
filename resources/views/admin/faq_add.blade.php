@extends('layouts.admin')

@section('title','FAQ Ekle')

@section('javascript')
    @FilemanagerScript
    <script src="https://cdn.ckeditor.com/4.14.0/standard/ckeditor.js"></script>
@endsection

@section('content')
    <div class="container-fluid mt-4">
        <div class="row justify-content-center">
            <div class="col-lg-8">
                <div class="card shadow">
                    <div class="card-header bg-success text-white">
                        <h5 class="mb-0">Sıkça Sorulan Soru Ekle</h5>
                    </div>
                    <div class="card-body">
                        <form action="{{ route('admin_faq_store') }}" method="POST">
                            @csrf

                            <div class="form-group">
                                <label for="position">Sıra</label>
                                <input type="number" name="position" id="position" class="form-control" value="0" placeholder="Pozisyon numarası">
                            </div>

                            <div class="form-group">
                                <label for="question">Soru</label>
                                <input type="text" name="question" id="question" class="form-control" placeholder="Soru metni">
                            </div>

                            <div class="form-group">
                                <label for="answer">Cevap</label>
                                <textarea name="answer" id="answer" class="form-control" rows="6"></textarea>
                            </div>

                            <div class="form-group">
                                <label for="status">Durum</label>
                                <select name="status" id="status" class="form-control">
                                    <option value="true">Aktif</option>
                                    <option value="false">Pasif</option>
                                </select>
                            </div>

                            <button type="submit" class="btn btn-primary btn-block">Kaydet</button>
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
