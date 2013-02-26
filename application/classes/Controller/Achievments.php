<?php defined('SYSPATH') or die('No direct script access.');

class Controller_Tests extends My_LoggedUserController {

        public function before()
	{
		parent::before();
                Helper_MainMenuHelper::setActiveItem('tests');
	}
        
	public function action_index()
	{
            $this->setTitle('Tests')
                    ->view('tests/index')
                    ->render();
	}

} 