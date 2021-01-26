<?php


    namespace App\Http\Controllers\Employee\EmployeePosition;


    use App\Http\Controllers\Employee\EmployeeCapability\CodeTestInterface;
    use App\Http\Controllers\Employee\EmployeeCapability\CodeWriteInterface;
    use App\Http\Controllers\Employee\EmployeeCapability\CommunicateInterface;
    use App\Http\Controllers\Employee\EmployeeCapabilityController;

    class DeveloperController extends EmployeeCapabilityController implements CodeWriteInterface, CodeTestInterface, CommunicateInterface
    {

        public function writeCode ()
        {

        }

        public function testCode ()
        {

        }

        public function communicate ()
        {

        }
    }
