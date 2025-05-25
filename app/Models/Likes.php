<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Likes extends Model
{
    use HasFactory;

    protected $fillable = [
        'user_id',
        'house_id'
    ];

    public function house(){
        return $this->belongsTo(House::class);
    }
    public function user(){
        return $this->belongsTo(User::class);
    }
}
