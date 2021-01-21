<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Employee extends Model
{
    public $timestamps = false;

    public function getPermissions()
    {
        return $this->hasMany(Permission::class);
    }

    public function permissions ()
    {
        return $this->belongsToMany(Permission::class);
    }
}
