<?php

/** @var \Illuminate\Database\Eloquent\Factory $factory */

use App\User;
use App\Store;
use App\Category;
use Faker\Generator as Faker;

/*
|--------------------------------------------------------------------------
| Model Factories
|--------------------------------------------------------------------------
|
| This directory should contain each of the model factory definitions for
| your application. Factories provide a convenient way to generate new
| model instances for testing / seeding your application's database.
|
*/

$factory->define(User::class, function (Faker $faker) {
    return [
        'name' => $faker->name,
        'email' => $faker->email,
    ];
});


$factory->define(Store::class, function (Faker $faker) {
    return [
        'category_id' => 1,
        'name' => $faker->name,
        'description' => $faker->name,
        'email' => $faker->email,
        'phone' => $faker->name,
        'place' => $faker->name,
        'mainphoto' => $faker->name,
        'gallery' => $faker->name
    ];
});



$factory->define(Category::class, function (Faker $faker) {
    return [
        'name' => $faker->name,
        'description' => $faker->name
    ];
});

