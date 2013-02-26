<?php defined('SYSPATH') or die('No direct script access.');

class Controller_Admin_Vacation extends My_AdminController {

    public function before()
    {
            parent::before();
            Helper_MainMenuHelper::setActiveItem('vacation');
    }

    public function action_index()
    {
        Helper_Output::factory()->link_js('admin/calendar/index');
        $data['years']     = ORM::factory('Vacation')->get_years();
        $data['users']     = ORM::factory('User')->find_all();
        $this->setTitle('Vacation')
                ->view('admin/vacation/index', $data)
                ->render();
    }
    
    public function action_get_vacation()
    {
        Helper_Jsonresponse::render_json('success', null, View::factory('admin/vacation/partials/calendar')->set('users', ORM::factory('User')->find_all())->set('year', $this->request->post('year'))->render());
    }
} 