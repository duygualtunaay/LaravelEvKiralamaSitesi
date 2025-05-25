<?php

namespace Database\Seeders;

use App\Models\House;
use Illuminate\Database\Seeder;
use Illuminate\Support\Str;

class HouseSeeder extends Seeder
{
    public function run(): void
    {
        $heatingTypes = ['Doğalgaz', 'Merkezi', 'Soba', 'Klima'];
        $furnishingOptions = ['Eşyalı', 'Eşyasız'];
        $addresses = ['İstanbul', 'Ankara', 'İzmir', 'Bursa', 'Antalya', 'Eskişehir'];

        for ($i = 1; $i <= 20; $i++) {
            House::create([
                'title' => "Emlak İlanı $i",
                'keywords' => "ev, ilan $i, kiralık",
                'description' => "Bu $i numaralı emlak ilanıdır.",
                'address' => $addresses[array_rand($addresses)] . " - Merkez Mah.",
                'phone' => '05' . rand(100000000, 999999999),
                'metrekare' => rand(45, 200),
                'isitma' => $heatingTypes[array_rand($heatingTypes)],
                'odasayisi' => rand(1, 5),
                'katsayisi' => rand(1, 10),
                'esya' => $furnishingOptions[array_rand($furnishingOptions)],
                'binayasi' => rand(0, 20),
                'price' => rand(5000, 150000),
                'aidat' => rand(0, 1000),
                'category_id' => 7,
                'user_id' => 1,
                'image' => 'images/demo.jpg',
                'detail' => '<p>Detay bilgisi: örnek içerik.</p>',
                'slug' => Str::slug("Emlak İlanı $i-" . Str::random(5)),
                'status' => 'true',
                'latitude' => rand(38000000, 42000000) / 1000000,
                'longitude' => rand(27000000, 30000000) / 1000000,
                'created_at' => now(),
                'updated_at' => now(),
            ]);
        }
    }
}
