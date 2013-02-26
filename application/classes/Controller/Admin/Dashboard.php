<?php defined('SYSPATH') or die('No direct script access.');

class Controller_Admin_Dashboard extends My_AdminController {

        public function before()
	{
		parent::before();
                Helper_MainMenuHelper::setActiveItem('dashboard');
	}
        
	public function action_index()
	{
            Helper_Output::factory()->link_js('admin/dashboard/index');
            $data['feeds'] = ORM::factory('Feed')->get_list(0, 0);
            $this->setTitle('Dasboard')
                    ->view('admin/dashboard/index', $data)
                    ->render();
	}
        
        public function action_delete()
        {
            ORM::factory('Feed', $this->request->post('id'))->delete();
            Helper_Jsonresponse::render_json('success', null, $this->request->post());
        }
        
        public function get_feeds()
        {

        }

} 