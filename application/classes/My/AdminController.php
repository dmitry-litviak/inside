<?php defined('SYSPATH') or die('No direct script access.');

class My_AdminController extends My_Layout
{
    public function before()
    {
            parent::before();

//                $this->m_UserData = Helper_iAuth::instance()->getLoggedUser();
//                if( !$this->m_UserData || !(bool)$this->m_UserData->id || !$this->m_UserData->has('roles', ORM::factory('role', array('name' => 'admin')))){
//                  $this->request->redirect( URL::base() );
//                }

//                Helper_AdminSiteBar::init(Kohana::$config->load('admin_menu')->get('admin_sitebar'));
            $this->logget_user = Auth::instance()->get_user();;
            if(empty($this->logget_user) || $this->logget_user->roles->order_by('role_id', 'desc')->find()->name != 'admin')
            {
                $this->redirect('dashboard');
            }
            Helper_MainMenuHelper::init(Kohana::$config->load('admin_menu')->get('admin_menu'));

            $this->template = View::factory('admin/layouts/main');

            Helper_Output::factory()
                                    ->link_css('bootstrap.min')
                                    ->link_css('admin')
                                    ->link_css('common')
                                    ->link_js('libs/jquey-1.8.2.min')
                                    ->link_js('libs/bootstrap.min')
                                    ->link_js('libs/underscore-min')
                                    ->link_js('libs/canvasloader-min')
                                    ->link_js('libs/jquery.blockUI')
                                    ->link_js('common')
                                    ->link_js('public/assets/workspace')
                                    ;

    }
  
}