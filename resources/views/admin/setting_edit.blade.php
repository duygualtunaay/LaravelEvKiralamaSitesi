@extends('layouts.admin')

@section('title','Ayarları Düzenle')

@section('javascript')
    @FilemanagerScript
    <script src="https://cdn.ckeditor.com/4.14.0/standard/ckeditor.js"></script>
@endsection

@section('content')
    <div class="container-fluid mt-4">
        <div class="row justify-content-center">
            <div class="col-lg-10">
                <div class="card shadow">
                    <div class="card-header bg-primary text-white">
                        <h5 class="mb-0">Site Ayarları</h5>
                        <small class="text-light">Genel site ayarlarını buradan düzenleyebilirsiniz.</small>
                    </div>
                    <div class="card-body">
                        <form action="{{ route('admin_setting_update') }}" method="POST" enctype="multipart/form-data">
                            @csrf
                            <input type="hidden" name="id" value="{{ $data->id }}">

                            {{-- Temel Bilgiler --}}
                            <div class="form-group">
                                <label for="title">Site Başlığı</label>
                                <input type="text" name="title" id="title" value="{{ $data->title }}" class="form-control" placeholder="Site başlığı">
                            </div>

                            <div class="form-group">
                                <label for="keywords">Anahtar Kelimeler</label>
                                <input type="text" name="keywords" id="keywords" value="{{ $data->keywords }}" class="form-control" placeholder="Keywords">
                            </div>

                            <div class="form-group">
                                <label for="description">Açıklama</label>
                                <input type="text" name="description" id="description" value="{{ $data->description }}" class="form-control" placeholder="Site açıklaması">
                            </div>

                            <div class="form-group">
                                <label for="company">Firma Adı</label>
                                <input type="text" name="company" id="company" value="{{ $data->company }}" class="form-control" placeholder="Firma adı">
                            </div>

                            {{-- İletişim --}}
                            <div class="form-group">
                                <label for="address">Adres</label>
                                <input type="text" name="address" id="address" value="{{ $data->address }}" class="form-control">
                            </div>

                            <div class="form-row">
                                <div class="form-group col-md-6">
                                    <label for="phone">Telefon</label>
                                    <input type="text" name="phone" id="phone" value="{{ $data->phone }}" class="form-control">
                                </div>
                                <div class="form-group col-md-6">
                                    <label for="fax">Fax</label>
                                    <input type="text" name="fax" id="fax" value="{{ $data->fax }}" class="form-control">
                                </div>
                            </div>

                            <div class="form-group">
                                <label for="email">E-posta</label>
                                <input type="email" name="email" id="email" value="{{ $data->email }}" class="form-control">
                            </div>

                            {{-- SMTP --}}
                            <div class="form-row">
                                <div class="form-group col-md-4">
                                    <label for="smtpserver">SMTP Sunucusu</label>
                                    <input type="text" name="smtpserver" id="smtpserver" value="{{ $data->smtpserver }}" class="form-control">
                                </div>
                                <div class="form-group col-md-4">
                                    <label for="smtpemail">SMTP Email</label>
                                    <input type="text" name="smtpemail" id="smtpemail" value="{{ $data->smtpemail }}" class="form-control">
                                </div>
                                <div class="form-group col-md-4">
                                    <label for="smtpport">SMTP Port</label>
                                    <input type="text" name="smtpport" id="smtpport" value="{{ $data->smtpport }}" class="form-control">
                                </div>
                            </div>

                            <div class="form-group">
                                <label for="smtppassword">SMTP Şifresi</label>
                                <input type="password" name="smtppassword" id="smtppassword" value="{{ $data->smtppassword }}" class="form-control">
                            </div>

                            {{-- Sosyal Medya --}}
                            <div class="form-row">
                                <div class="form-group col-md-6">
                                    <label for="facebook">Facebook</label>
                                    <input type="text" name="facebook" id="facebook" value="{{ $data->facebook }}" class="form-control">
                                </div>
                                <div class="form-group col-md-6">
                                    <label for="twitter">Twitter</label>
                                    <input type="text" name="twitter" id="twitter" value="{{ $data->twitter }}" class="form-control">
                                </div>
                            </div>

                            <div class="form-row">
                                <div class="form-group col-md-6">
                                    <label for="instagram">Instagram</label>
                                    <input type="text" name="instagram" id="instagram" value="{{ $data->instagram }}" class="form-control">
                                </div>
                                <div class="form-group col-md-6">
                                    <label for="youtube">YouTube</label>
                                    <input type="text" name="youtube" id="youtube" value="{{ $data->youtube }}" class="form-control">
                                </div>
                            </div>

                            {{-- İçerik Alanları --}}
                            <div class="form-group">
                                <label for="aboutus">Hakkımızda</label>
                                <textarea name="aboutus" id="aboutus" class="form-control" rows="5">{{ $data->aboutus }}</textarea>
                            </div>

                            <div class="form-group">
                                <label for="contact">İletişim</label>
                                <textarea name="contact" id="contact" class="form-control" rows="5">{{ $data->contact }}</textarea>
                            </div>

                            <div class="form-group">
                                <label for="references">Referanslar</label>
                                <textarea name="references" id="references" class="form-control" rows="5">{{ $data->references }}</textarea>
                            </div>

                            {{-- Durum --}}
                            <div class="form-group">
                                <label for="status">Durum</label>
                                <select name="status" id="status" class="form-control">
                                    <option value="true" @if($data->status == 'true') selected @endif>Aktif</option>
                                    <option value="false" @if($data->status == 'false') selected @endif>Pasif</option>
                                </select>
                            </div>

                            {{-- Submit --}}
                            <button type="submit" class="btn btn-success btn-block">Güncelle</button>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <script>
        window.onload = function () {
            CKEDITOR.replace('aboutus', { filebrowserBrowseUrl: filemanager.ckBrowseUrl });
            CKEDITOR.replace('contact', { filebrowserBrowseUrl: filemanager.ckBrowseUrl });
            CKEDITOR.replace('references', { filebrowserBrowseUrl: filemanager.ckBrowseUrl });
        };
    </script>
@endsection
