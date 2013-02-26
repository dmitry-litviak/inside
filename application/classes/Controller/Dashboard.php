<?php defined('SYSPATH') or die('No direct script access.');

class Controller_Dashboard extends My_LoggedUserController {

        public function before()
	{
		parent::before();
                Helper_MainMenuHelper::setActiveItem('dashboard');
	}
        
	public function action_index()
	{
            Helper_Output::factory()->link_js('libs/underscore-min')
                                    ->link_js('public/assets/workspace')
                                    ->link_js('dashboard/index');
            $data['feeds'] = ORM::factory('Feed')->get_list(0, 0);
            $this->setTitle('Dashboard')
                    ->view('dashboard/index', $data)
                    ->render();
	}
        
        public function action_get_feeds()
        {
            $feed = ORM::factory('Feed')->get_list(0, 0, $this->request->post("filter_feed"), $this->request->post("filter_pr"));
            Helper_Jsonresponse::render_json('success', null, $feed);
        }

} 