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
        $employee_capabilities = $employeeController->getEmployeeCapabilities($employee_title);

        foreach ($employee_capabilities as $employee_capability) {
            $this->info($employee_capability);
        }
    }
}
