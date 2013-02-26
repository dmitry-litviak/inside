<?php defined('SYSPATH') or die('No direct script access.');

class Controller_Developers extends My_LoggedUserController {

        public function before()
	{
		parent::before();
                Helper_MainMenuHelper::setActiveItem('developers');
	}
        
	public function action_index()
	{
            Helper_Output::factory()->link_js('libs/underscore-min')
                                    ->link_js('public/assets/workspace')
                                    ->link_js('developers/index');
            $data['users'] = ORM::factory('User')->get_list(0, 0);
            $this->setTitle('Developers')
                    ->view('developers/index', $data)
                    ->render();
	}
        
        public function action_get_developers()
        {
            $devs = ORM::factory('User')->get_list(0, 0, $this->request->post('filter_dev'), $this->request->post('filter_pr'));
            Helper_Jsonresponse::render_json('success', null, $devs);
        }

} 