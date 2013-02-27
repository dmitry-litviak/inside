<?php defined('SYSPATH') or die('No direct access allowed.');
$data['main_menu']  = array(
        "dashboard" 	=> array(
                                        'name'      => "Dashboard",
                                        'url'    	=> 'dashboard',
                                        'status'	=> 1
                                ),
        "developers"	=> array(
                                        'name'      => "Developers",
                                        'url'		=> "developers",
                                        'status'	=> 0
                                ),                        
        "tests"         => array(
                                        'name'      => "Tests",
                                        'url'		=> "tests",
                                        'status'	=> 0
                                ),
        "notices"	    => array(
                                        'name'          => "Notices",
                                        'url'           => "notices",
                                        'status'        => 0
                                ),
        "career"	    => array(
                                        'name'          => "Career",
                                        'url'           => "career",
                                        'status'        => 0
                                ),
        "edit_page" 	=> array(
                                        'name'      => "Edit Profile",
                                        'url'    	=> 'users/edit',
                                        'status'	=> 0,
                                        'icon'      => ''
        )
);
return $data;
