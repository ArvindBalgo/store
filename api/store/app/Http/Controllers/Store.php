<?php

namespace App\Http\Controllers;

use App\Store;
use App\Category;
use Illuminate\Http\Request;
use Illuminate\Http\Response;
use Illuminate\Database\Eloquent\ModelNotFoundException;


class StoreController extends Controller
{
    /**
     * Create a new controller instance.
     *
     * @return void
     */
    public function __construct()
    {
        //
    }
	
	public function AllStores()
    {
    	return response()->json(Store::all());
    }

    public function AllCategories()
    {
    	return response()->json(Category::all());
    }

	public function FindByid($id)
    {
    	$id = $request->input("id");		
    	try{
    		$model = Store::where('id', $id)->firstOrFail();
    		return response()->json([$model]);	
		} catch (ModelNotFoundException $e) {
			$content = " Notfound: Store with id ".$id." doesn’t exist";
			$status = "404";
			return (new Response($content, $status));
		} 
    }

    public function FindByCategory(Request $request, $category){
	
		$cat = Category::where('id', $category)->firstOrFail();
		//return "";
		return response()->json($cat->Stores);	
    }

    public function FindByFilters($category, $keyworld){
        
    }

	public function AddStore(Request $request){
		$name = $request->input('name');
		$description = $request->input('description');
		$email = $request->input('email');
		$phone = $request->input('phone');
		$place = $request->input('place');
		$mainphoto = $request->input('mainphoto');
		$mainphoto = $request->input('mainphoto');
		$gallery = $request->input('gallery');

		$store  = Store::create(
			['name' => $name,
			'description' => $description,
			'email' => $description,
			'phone' => $phone,
			'place' => $place,
			'mainphoto' => $mainphoto,
			'gallery' => $gallery]
		);
		
		
		return response()->json([$store]);	
	}

	public function AddCategory(Request $request){
        $tab = array();
        $tab = $this->InitModelAttributesFromRequest(["name", "description"], $request, $tab);
		$cat  = Category::create(
			$tab
		);
		
		
		return response()->json([$cat]);	
	}

	
	private function InitModelAttributesFromRequest($attributeKeys, $request,$model){
		foreach($attributeKeys as $key){
			$val = $request->input($key);
			if(isset($val) && !empty($val) )
			$model[$key] = $val;
		}
		return $model;
	}


	public function UpdateStore(Request $request){

		$id = $request->input("id");		
	    try {
	    	$model = Store::where('id', $id)->firstOrFail();
			$keys = [
			'name', 'description', 'email', 'phone', 'place', 'mainphoto', 'gallery'
			];
		    $model = $this->InitModelAttributesFromRequest($keys, $request, $model);
		    $model->save();
		    return response()->json([$model]);	
		} catch (ModelNotFoundException $e) {
			$content = "update failed: id of the store not found.";
			$status = "404";
			return (new Response($content, $status));
		} 
	}

	public function UpdateCategory(Request $request){

		$id = $request->input("id");		
	    try {
	    	$model = Category::where('id', $id)->firstOrFail();
			$keys = ['name', 'description'];
		    $model = $this->InitModelAttributesFromRequest($keys, $request, $model);
		    $model->save();
		    return response()->json([$model]);	
		} catch (ModelNotFoundException $e) {
			$content = "update failed: id of the Category not found.";
			$status = "404";
			return (new Response($content, $status));
		} 
	}
}
