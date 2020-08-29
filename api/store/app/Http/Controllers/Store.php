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
		$stores = Store::all();		
		$stores->load('Subcategories');

        $result = array();		
	    $listcat = Category::all();
		
		foreach($listcat as $cat){				
			$qb = Subcategory::where('category_id', '=', $cat->id);		
			$subcategories = $qb->get();
			$subids = array();
			foreach($subcategories as $sub){
				array_push($subids, $sub->id);
			}

			$tmpstores = array();
			foreach($stores as $st){
					foreach($st->subcategories as $tmpsub){
						if(in_array($tmpsub->id, $subids)){	
							array_push($tmpstores, $st);
							continue;
						}
				}	                					
		   }                               
		   $tmpcat = [
				"type" => "category",
				"id" => $cat->id,
				"name" => $cat->name,
				"stores" => $tmpstores
			];
			array_push($result, $tmpcat);
		}			
		
       

		return response()->json($result);
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
		$stores = $querybuilder->get();
		$stores->load('Subcategories');

        $result = array();
		if(!empty($category) && $category != "all"){
			$tabcat = explode("|", $category);
		    $listcat = Category::find($tabcat);
		}else{
			$listcat = Category::all();
		}
		foreach($listcat as $cat){				
			$qb = Subcategory::where('category_id', '=', $cat->id);		
			$subcategories = $qb->get();
			$subids = array();
			foreach($subcategories as $sub){
				array_push($subids, $sub->id);
			}

			$tmpstores = array();
			foreach($stores as $st){
					foreach($st->subcategories as $tmpsub){
						if(in_array($tmpsub->id, $subids)){	
							array_push($tmpstores, $st);
							continue;
						}
				}	                					
		   }                               
		   $tmpcat = [
				"type" => "category",
				"id" => $cat->id,
				"name" => $cat->name,
				"stores" => $tmpstores
			];
			array_push($result, $tmpcat);
		}			
		
       

		return response()->json($result);
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


		$stores = array();
		$subcategoriesFormated = array();	
		$addedIds = array();
		$subcategories->load('Stores');
		foreach($subcategories as $sub){
			foreach($sub->Stores as $st){
				if($st){
                    if(!in_array($st->id, $addedIds)){
                        	array_push($stores, $st);
                        	array_push($addedIds, $st->id); 	
                    }
				}
			
			}
			array_push($subcategoriesFormated, [
			"id" => $sub->id,
            "name" => $sub->name
			]);
		}

	
	
		$data = [
            "subcategories" => $subcategoriesFormated,
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
			'name', 'description', 'email', 'phone', 'place', 'mainphoto', 'gallery', 'category_id', 'featured'
			];
		    $model = $this->InitModelAttributesFromRequest($keys, $request, $model);

		     $subcatids = $request->input("subcategory_ids");
		     $model->load("Subcategories");
			if(!empty($subcatids)){
			    //remove all subcategories
			    foreach($model->Subcategories as $sub){
					$model->Subcategories()->detach($sub->id);
				}

				$tabcat = explode("|", $subcatids);
				foreach($tabcat as $cat){
					$model->Subcategories()->attach($cat);
				}
			}				

		    $model->save();
		    $model->load("Subcategories");
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
		$store->load("Subcategories");			
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

	public function updateSubcategory(Request $request, $id)
    {
        $sub = Subcategory::findOrFail($id);
        $sub->update($request->all());

        return response(['data' => $sub ], 200);
    }

    public function destroyStore($id)
    {
        Store::destroy($id);
        return response(['data' => null ], 204);
    }

	public function destroySubcategory($id)
    {
        Subcategory::destroy($id);
        return response(['data' => null ], 204);
    }
    
    public function destroyCategory($id)
    {
        Category::destroy($id);
        return response(['data' => null ], 204);
    }

	

}
