<?php defined('SYSPATH') or die('No direct access allowed.');
$data['main_menu']  = array(
        "dashboard" 	=> array(
                                        'name'      => "Dashboard",
                                        'url'    	=> 'dashboard',
                                        'status'	=> 1,
                                        'icon'      => '<i class="icon-chevron-right"></i>'
                                ),
        "developers"	=> array(
                                        'name'      => "Developers",
                                        'url'		=> "developers",
                                        'status'	=> 0,
                                        'icon'      => '<i class="icon-chevron-right"></i>'
                                ),                        
        "tests"         => array(
                                        'name'      => "Tests",
                                        'url'		=> "tests",
                                        'status'	=> 0,
                                        'icon'      => '<i class="icon-chevron-right"></i>'
                                ),
        "notices"	    => array(
                                        'name'          => "Notices",
                                        'url'           => "notices",
                                        'status'        => 0,
                                        'icon'          => '<i class="icon-chevron-right"></i>'
                                ),
        "career"	    => array(
                                        'name'          => "Career",
                                        'url'           => "career",
                                        'status'        => 0,
                                        'icon'          => '<i class="icon-chevron-right"></i>'
                                ),
        "edit_page" 	=> array(
                                        'name'      => "Edit page",
                                        'url'    	=> 'users/edit',
                                        'status'	=> 0,
                                        'icon'      => ''
        ),
        "logout"	    => array(
                                        'name'      => "Logout",
                                        'url'		=> "session/logout",
                                        'status'	=> 0,
                                        'icon'      => ''
        )
);
return $data;
