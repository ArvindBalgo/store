<?php

/*
|--------------------------------------------------------------------------
| Application Routes
|--------------------------------------------------------------------------
|
| Here is where you can register all of the routes for an application.
| It is a breeze. Simply tell Lumen the URIs it should respond to
| and give it the Closure to call when that URI is requested.
|
*/

$router->get('/', function () use ($router) {
    return $router->app->version();
});


// Get

$router->group(['prefix' => 'api'], function () use ($router) {
    $router->get('store/all', 'StoreController@AllStores');
    $router->get('category/all', 'StoreController@AllCategories');

    $router->get('store/filter/{category}/{keyworld}', 'Store@FindByFilters');
    $router->get('store/byid/{id}', 'Store@FindById');
    $router->get('store/bycategories/{category}', 'StoreController@FindByCategory');

	$router->put('store/update', 'StoreController@UpdateStore');
	$router->put('category/update', 'StoreController@UpdateCategory');
		
    $router->post('store/add', 'StoreController@AddStore');
    $router->post('category/add', 'StoreController@AddCategory');
 });
/*
/store/mostviewed =>  retourn une liste qui sera ordonné par nombre de vue
/store/{category}/{keyworld}/ => fitrer liste de store par id
/store/{id} => Obtenir le store par l’id
/store/categories => Liste de categories
*/