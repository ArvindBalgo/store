<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Users extends Model
{
    protected $guarded = ['id'];
    protected $fillable = ['name', 'login', 'password'];
}
