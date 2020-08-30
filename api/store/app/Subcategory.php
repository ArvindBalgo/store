<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Subcategory extends Model
{
    protected $guarded = ['id'];
    protected $fillable = ['name'];


	/**
     * The table associated with the model.
     *
     * @var string
     */
    protected $table = 'subcategory';
	
	
	 /**
     * Get the Category .
     */
    public function Category()
    {
        return $this->belongsTo('App\Category');
    }

     /**
     * The roles that belong to the .
     */
    public function Stores()
    {
        return $this->belongsToMany('App\Store');
    }
}
