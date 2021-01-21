<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Permission extends Model
{
    public $timestamps = false;

    public function employees ()
    {
        return $this->belongsToMany(Employee::class);
    }
}
