<?php defined('SYSPATH') or die('No direct script access.');

class My_LoggedUserController extends My_UserController
{
    protected $m_UserData;   
    
    public function before()
    {
        parent::before();
        $this->logget_user = Auth::instance()->get_user();
        if(empty($this->logget_user->id))
            $this->redirect('');
        Helper_MainMenuHelper::init(Kohana::$config->load('main_menu')->get('main_menu'));
        Helper_Output::factory()->link_js('main');
    }
}
