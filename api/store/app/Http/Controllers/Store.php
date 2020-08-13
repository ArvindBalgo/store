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

	public function FindByFilters($category, $keyword){
		$querybuilder = Store::where('name', 'like', "%".$keyword."%")->orWhere('description', 'like', "%".$keyword."%");		
		
		if(!empty($category) && $category != "all"){
			$querybuilder = Store::where([
				['name', 'like', "%".$keyword."%"],
				['category_id', '=', $category]
				])
			->orWhere([
			['description', 'like', "%".$keyword."%"], 
			['category_id', '=', $category]
			]);		
		}
		return response()->json($querybuilder->get());
    }

	public function FindById($id)
    {
    	try{
    		$model = Store::where('id', $id)->firstOrFail();
    		return response()->json([$model]);	
		} catch (ModelNotFoundException $e) {
			$content = "Notfound: Store with id ".$id." doesn’t exist";
			$status = "404";
			return (new Response($content, $status));
		} 
    }

    public function FindByCategories(Request $request, $category){
		$tabcat = explode("|", $category);
		$qb = Store::where('category_id', '=', -1);		
		foreach($tabcat as $cat){
			$qb = 	$qb->orWhere('category_id', $cat);
		}
		$cats = $qb->get();
		return response()->json($cats);	
    }

	private function InitModelAttributesFromRequest($attributeKeys, $request,$model){
		foreach($attributeKeys as $key){
			$val = $request->input($key);
			if(isset($val) && !empty($val) )
			$model[$key] = $val;
		}
		return $model;
	}


	public function UpdateStore(Request $request, $id){
	    try {
	    	$model = Store::where('id', $id)->firstOrFail();
			$keys = [
			'name', 'description', 'email', 'phone', 'place', 'mainphoto', 'gallery', 'category_id'
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

	public function UpdateCategory(Request $request, $id){		
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
	
	public function AddStore(Request $request){
		// $name = $request->input('name');
		// $description = $request->input('description');
		// $email = $request->input('email');
		// $phone = $request->input('phone');
		// $place = $request->input('place');
		// $mainphoto = $request->input('mainphoto');
		// $mainphoto = $request->input('mainphoto');
		// $gallery = $request->input('gallery');
		$tab = array();
		$keys = [
			'name', 'description', 'email', 'phone', 'place', 'mainphoto', 'gallery', 'category_id'
		];
		$tab = $this->InitModelAttributesFromRequest($keys, $request, $tab);
var_dump($tab);
		$store  = Store::create(
			// ['name' => $name,
			// 'description' => $description,
			// 'email' => $description,
			// 'phone' => $phone,
			// 'place' => $place,
			// 'mainphoto' => $mainphoto,
			// 'gallery' => $gallery]
			$tab
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

}
