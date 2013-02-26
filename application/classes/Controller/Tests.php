<?php defined('SYSPATH') or die('No direct script access.');

class Controller_Tests extends My_LoggedUserController {

        public function before()
	{
		parent::before();
                Helper_MainMenuHelper::setActiveItem('tests');
	}
        
	public function action_index()
	{
            $data['certificates'] = ORM::factory('Feed')->get_certificates();
            $this->setTitle('Tests')
                    ->view('tests/index', $data)
                    ->render();
	}

} 