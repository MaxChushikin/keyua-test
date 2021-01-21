<?php

namespace App\Console\Commands;

use App\Http\Controllers\EmployeeController;
use Illuminate\Console\Command;

class Company extends Command
{
    /**
     * The name and signature of the console command.
     *
     * @var string
     */
    protected $signature = 'company:employee {employee}';

    /**
     * The console command description.
     *
     * @var string
     */
    protected $description = 'Command description';

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

        $permissions = $employeeController->getEmployee($employee_title);

        foreach ($permissions as $permission) {
            $this->info($permission->title);
        }
    }
}
