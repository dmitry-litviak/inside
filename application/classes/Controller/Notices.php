<?php defined('SYSPATH') or die('No direct script access.');

class Controller_Notices extends My_LoggedUserController {

    public function before()
    {
        parent::before();
        Helper_MainMenuHelper::setActiveItem('notices');
        Helper_Display::instance()->displayNotices(false)
        ;
    }

    public function action_index()
    {
//            $data['certificates'] = ORM::factory('Feed')->get_certificates();
        $this->setTitle('Notices')
                ->view('notices/index')
                ->render();
    }

} 