<?php

namespace App\Http\Controllers;

use App\Employee;
use Illuminate\Http\Request;



class EmployeeController extends Controller
{
    //

    public function index ()
    {
        $employees = Employee::all();

        dd($employees);
    }

    public function getEmployee ($employee_title)
    {
        $employee = Employee::where('title', $employee_title)->firstOrFail();

        return $employee->permissions()->get();
    }

    public function validateEmployeePermission ($employee_title, $permission_title)
    {

        $employee = Employee::where('title', $employee_title)->first();

        if ($employee){

            $permissions = $employee->permissions()->where('title', '=', $permission_title)->first();

            if ($permissions){
                $result = true;
            } else {
                $result = "The {$employee_title} can't  \"{$permission_title}\"";
            }
        } else {
            $result = "No one Employee with \"{$employee_title}\" title";
        }

        return $result;
    }
}
