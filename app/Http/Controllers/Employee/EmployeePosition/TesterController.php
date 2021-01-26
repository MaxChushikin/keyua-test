<?php


	namespace App\Http\Controllers\Employee\EmployeePosition;


	use App\Http\Controllers\Employee\EmployeeCapability\CodeTestInterface;
    use App\Http\Controllers\Employee\EmployeeCapability\CommunicateInterface;
    use App\Http\Controllers\Employee\EmployeeCapability\SetTaskInterface;
    use App\Http\Controllers\Employee\EmployeeCapabilityController;

    class TesterController extends EmployeeCapabilityController implements CodeTestInterface, CommunicateInterface, SetTaskInterface
	{

        public function testCode ()
        {

        }

        public function communicate ()
        {

        }

        public function setTask ()
        {

        }
    }
