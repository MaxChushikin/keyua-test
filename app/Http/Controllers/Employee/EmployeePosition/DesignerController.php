<?php


    namespace App\Http\Controllers\Employee\EmployeePosition;


    use App\Http\Controllers\Employee\EmployeeCapability\CommunicateInterface;
    use App\Http\Controllers\Employee\EmployeeCapability\DrawInterface;
    use App\Http\Controllers\Employee\EmployeeCapabilityController;

    class DesignerController extends EmployeeCapabilityController implements DrawInterface, CommunicateInterface
    {

        public function communicate ()
        {

        }

        public function draw ()
        {

        }
    }
