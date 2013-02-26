<?php defined('SYSPATH') or die('No direct script access.');

class Controller_Career extends My_LoggedUserController {

        public function before()
	{
		parent::before();
                Helper_MainMenuHelper::setActiveItem('career');
	}
        
	public function action_index()
	{
            $this->setTitle('Career')
                    ->view('career/index')
                    ->render();
	}

} 
