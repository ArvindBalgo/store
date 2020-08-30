<?php

use Laravel\Lumen\Testing\DatabaseMigrations;
use Laravel\Lumen\Testing\DatabaseTransactions;

class ExampleTest extends TestCase
{
    /**
     * A basic test example.
     *
     * @return void
     */
    public function testExample()
    {
		$cat = factory('App\Category', 3)->make()->each(function($cat) {
			$cat->save();
			$size = 20;
			for($i = 0; $i < $size ; $i++){
				$store = factory('App\Store')->make();
				$store->save();				
			}
		});
    }
}
