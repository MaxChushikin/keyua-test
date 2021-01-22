<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Employee extends Model
{
    public $timestamps = false;

    public function permissions ()
    {
        return $this->belongsToMany(Permission::class);
    }
}
