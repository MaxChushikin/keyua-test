<?php

namespace App\Console\Commands;

use App\Http\Controllers\EmployeeController;
use Illuminate\Console\Command;

class Employee extends Command
{
    /**
     * The name and signature of the console command.
     *
     * @var string
     */
    protected $signature = 'employee:can {employee} {permission}';

    /**
     * The console command description.
     *
     * @var string
     */
    protected $description = 'Check if the employee can do something';

    /**
     * Create a new command instance.
     *
     * @return void
     */
    public function __construct()
    {
        parent::__construct();
    }

    /**
     * Execute the console command.
     *
     * @return mixed
     */
    public function handle(EmployeeController $employeeController)
    {
        $employee_title = $this->argument('employee');
        $permission_title = $this->argument('permission');

        $result = $employeeController->validateEmployeePermission($employee_title, $permission_title);

        $this->info((string)$result);
    }
}
