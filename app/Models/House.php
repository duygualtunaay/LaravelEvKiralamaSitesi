<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class House extends Model
{
    use HasFactory;
    protected $fillable = [
        'title',
        'keywords',
        'description',
        'address',
        'phone',
        'metrekare',
        'isitma',
        'odasayisi',
        'katsayisi',
        'esya',
        'binayasi',
        'price',
        'aidat',
        'category_id',
        'user_id',
        'image',
        'detail',
        'slug',
        'status',
        'latitude',
        'longitude'
    ];


    public function category()
    {
        return $this->belongsTo(Category::class);
    }

}
