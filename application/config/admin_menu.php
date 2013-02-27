<?php defined('SYSPATH') or die('No direct access allowed.');
$data['admin_menu']  = array(                                
        "employees" 	=> array(
                                        'name'      => "Employees",
                                        'url'    	=> 'admin/employees',
                                        'status'	=> 1
                                ),
        "notices"	=> array(
                                        'name'      => "Notices",
                                        'url'		=> "admin/notices",
                                        'status'	=> 0
                                ),                        
        "dashboard"      => array(
                                        'name'      => "Dashboard",
                                        'url'		=> "admin/dashboard",
                                        'status'	=> 0
                                ),
        "vacation"      => array(
                                        'name'      => "Vacation Calendar",
                                        'url'		=> "admin/vacation",
                                        'status'	=> 0
                                ),
        "settings"      => array(
                                        'name'      => "Settings",
                                        'url'		=> "admin/settings",
                                        'status'	=> 0
                                ),
);
return $data;
