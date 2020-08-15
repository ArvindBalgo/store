<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Store extends Model 
{

    /**
     * The attributes that are mass assignable.
     *
     * @var array
     */
    protected $fillable = [
        'name', 'description', 'email', 'phone', 'place', 'mainphoto', 'gallery', 'featured', 'beginhour',
        'endhour'
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
     * Indicates if the IDs are auto-incrementing.
     *
     * @var bool
     */
    public $incrementing = false;

     /**
     * Get the Category of the store.
     */
    public function category()
    {
        return $this->belongsTo('App\Category');
    }
}
