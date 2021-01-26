<?php


	namespace App\Http\Controllers\Employee;

    use App\Http\Controllers\Employee\EmployeeCapability\CodeTestInterface;
    use App\Http\Controllers\Employee\EmployeeCapability\CodeWriteInterface;
    use App\Http\Controllers\Employee\EmployeeCapability\CommunicateInterface;
    use App\Http\Controllers\Employee\EmployeeCapability\DrawInterface;
    use App\Http\Controllers\Employee\EmployeeCapability\SetTaskInterface;

    abstract class EmployeeCapabilityController
	{
        public function getEmployeeCapabilities ()
        {
            $capabilities = [];

            if ($this instanceof CodeWriteInterface)
                $capabilities[] = 'Code writing';
            if ($this instanceof CodeTestInterface)
                $capabilities[] = "Code testing";
            if ($this instanceof DrawInterface)
                $capabilities[] = "Designing";
            if ($this instanceof CommunicateInterface)
                $capabilities[] = "Communication with manager";
            if ($this instanceof SetTaskInterface)
                $capabilities[] = "Setting tasks";

            return $capabilities;
	    }

        public function validateEmployeeCapabilityByTitle ($capabilityMethod)
        {
            return method_exists($this, $capabilityMethod);
	    }
	}
