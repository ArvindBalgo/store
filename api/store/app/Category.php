<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Category extends Model 
{

    /**
     * The attributes that are mass assignable.
     *
     * @var array
     */
    protected $fillable = [
        'name', 'description'
    ];

    /**
     * The attributes excluded from the model's JSON form.
     *
     * @var array
     */
   /* protected $hidden = [
        'password',
    ];*/
	
	
	/**
     * The table associated with the model.
     *
     * @var string
     */
    protected $table = 'category';
	
	
	/**
     * The primary key associated with the table.
     *
     * @var string
     */
	protected $primaryKey = 'id';
	
	 /**
     * Indicates if the IDs are auto-incrementing.
     *
     * @var bool
     */
    public $incrementing = false;


    /**
     * Get the list of store from category.
     */
    public function Subcategories()
    {
        return $this->hasMany('App\Subcategory');
    }

}
