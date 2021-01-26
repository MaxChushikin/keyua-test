<?php

namespace App\Http\Controllers;


class EmployeeController extends Controller
{
    public function getEmployeeCapabilities ($employee_title)
    {
        $class_name =  'App\Http\Controllers\Employee\EmployeePosition\\'. ucfirst($employee_title) . 'Controller';

        if (class_exists($class_name)){
            $employee = new $class_name();
            $employee_capabilities = $employee->getEmployeeCapabilities();
        } else {
            $employee_capabilities = ["No employers with \"$employee_title\" name"];
        }

        return $employee_capabilities;
    }

    public function validateEmployeeCapabilityByTitle ($employee_title, $capability_title)
    {
        $class_name =  'App\Http\Controllers\Employee\EmployeePosition\\'. ucfirst($employee_title) . 'Controller';

        if (class_exists($class_name)){
            $employee = new $class_name();

            $employee_capabilities = $employee->validateEmployeeCapabilityByTitle($capability_title);
        } else {
            $employee_capabilities = "No employers with \"$employee_title\" name";
        }

        return $employee_capabilities ? 'true' : 'false';
    }
}
