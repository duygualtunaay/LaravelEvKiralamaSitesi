<?php

namespace Database\Seeders;

use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Str;

class HouseImageSeeder extends Seeder
{
    public function run(): void
    {
        $houseIds = array_merge([1, 9], range(10, 110));
        $faker = \Faker\Factory::create();

        foreach ($houseIds as $houseId) {
            $imageCount = rand(1, 3);

            for ($i = 0; $i < $imageCount; $i++) {
                DB::table('images')->insert([
                    'title' => 'foto' . ($i + 1),
                    'image' => 'images/demo.jpg',
                    'house_id' => $houseId,
                    'created_at' => now(),
                    'updated_at' => now(),
                ]);
            }
        }
    }
}
