<?php

use Illuminate\Database\Seeder;
use App\Employee;
Use App\Permission;

class DatabaseSeeder extends Seeder
{
    private $employees = ['Programmer', 'Designer', 'Tester', 'Manager'];
    private $permissions = ['code', 'test', 'communicate', 'draw', 'task'];
    private $relation = [
        'Programmer'    => ['code', 'test', 'communicate'],
        'Designer'      => ['draw', 'communicate'],
        'Tester'        => ['test', 'communicate', 'task'],
        'Manager'       => ['task'],
    ];

    /**
     * Seed the application's database.
     *
     * @return void
     */
    public function run()
    {
        foreach ($this->employees as $employee) {
            DB::table('employees')->insert([
                'title' => $employee,
            ]);
        }

        foreach ($this->permissions as $permission) {
            DB::table('permissions')->insert([
                'title' => $permission,
            ]);
        }

        foreach ($this->relation as $employee => $permissions) {
            $employee_obj = Employee::where('title', '=', $employee)->first()->id;

            foreach ($permissions as $permission) {
                $permission_obj = Permission::where('title', '=', $permission)->first()->id;

                $employee_permission = [
                    [
                        'employee_id' => $employee_obj,
                        'permission_id' => $permission_obj
                    ]
                ];

                DB::table('employee_permission')->insert($employee_permission);
            }
        }
    }
}
