<?php defined('SYSPATH') or die('No direct access allowed.');
$data['admin_menu']  = array(                                
        "employees" 	=> array(
                                        'name'      => "Employees",
                                        'url'    	=> 'admin/employees',
                                        'status'	=> 1,
                                        'icon'      => '<i class="icon-chevron-right"></i>'
                                ),
        "notices"	=> array(
                                        'name'      => "Notices",
                                        'url'		=> "admin/notices",
                                        'status'	=> 0,
                                        'icon'      => '<i class="icon-chevron-right"></i>'
                                ),                        
        "dashboard"      => array(
                                        'name'      => "Dashboard",
                                        'url'		=> "admin/dashboard",
                                        'status'	=> 0,
                                        'icon'      => '<i class="icon-chevron-right"></i>'
                                ),
        "vacation"      => array(
                                        'name'      => "Vacation Calendar",
                                        'url'		=> "admin/vacation",
                                        'status'	=> 0,
                                        'icon'      => '<i class="icon-chevron-right"></i>'
                                ),
        "settings"      => array(
                                        'name'      => "Settings",
                                        'url'		=> "admin/settings",
                                        'status'	=> 0,
                                        'icon'      => '<i class="icon-chevron-right"></i>'
                                ),
);
return $data;
