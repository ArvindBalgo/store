<?php

namespace App\Http\Controllers;

use App\Store;
use App\Category;
use App\Subcategory;
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
     
     public function AllSubCategories()
    {
    	return response()->json(Subcategory::all());
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

	public function FindById(Request $request,$id)
    {
    	try{
    		$model = Store::where('id', $id)->firstOrFail();
    		$model->load('Subcategories');
    		return response()->json([$model
    		]);	
		} catch (ModelNotFoundException $e) {
			$content = "Notfound: Store with id ".$id." doesn’t exist";
			$status = "404";
			return (new Response($content, $status));
		} 
    }

    public function FindByCategories(Request $request, $category){
		$tabcat = explode("|", $category);

		//subcategories
		$qb = Subcategory::where('category_id', '=', -1);		
		foreach($tabcat as $cat){
			$qb = 	$qb->orWhere('category_id', $cat);
		}
		$subcategories = $qb->get();


		//stores
		//list ids


		$qb = Store::where('category_id', '=', -1);
		$stores = array();
		$subcategories->load('Stores');
		foreach($subcategories as $sub){
			foreach($sub->Stores as $st){
				if($st){
					array_push($stores, $st);
				}
			}
		}

	
	
		$data = [
            "subcategories" => $subcategories,
            "stores" => $stores
		];
		return response()->json($data);	
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
		$store  = Store::create(
		$request->all()
		);

        $subcatids = $request->input("subcategory_ids");
		if(!empty($subcatids)){
            $tabcat = explode("|", $subcatids);
			
			$qb = Subcategory::where('id', '=', -1);		
			foreach($tabcat as $cat){
				$qb = 	$qb->orWhere('id', $cat);
			}
		    $cats = $qb->get();	

		    foreach($cats as $cat){
		       $store->Subcategories()->save($cat);
		    }	
		}

		
		
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

	public function AddSubCategory(Request $request){
		try{
			$catid = $request->input("category_id");
    		$cat = Category::where('id', $catid)->firstOrFail();
		    
		    $subcat = new Subcategory($request->all());
		    $cat->Subcategories()->save($subcat);    		
    		return response()->json([$subcat]);	
		} catch (ModelNotFoundException $e) {
			$content = "Notfound: Store with id ".$id." doesn’t exist";
			$status = "404";
			return (new Response($content, $status));
		} 
	}

}
