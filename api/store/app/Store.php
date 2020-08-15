<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Store extends Model 
{

    protected $guarded = ['id'];

    /**
     * The attributes that are mass assignable.
     *
     * @var array
     */
    protected $fillable = [
        'name', 'description', 'email', 'phone', 'place', 'mainphoto', 'gallery', 'featured', 'beginhour',
        'closehour', 'featued'
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
    protected $table = 'store';
	
	
	/**
     * The primary key associated with the table.
     *
     * @var string
     */
	protected $primaryKey = 'id';
	
	


     /**
     * The roles that belong to the .
     */
    public function Subcategories()
    {
        return $this->belongsToMany('App\Subcategory');
    }
}
