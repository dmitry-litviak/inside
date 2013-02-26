<?php defined('SYSPATH') or die('No direct script access.');

class Controller_Admin_Notices extends My_AdminController {

    public function before()
    {
            parent::before();
            Helper_MainMenuHelper::setActiveItem('notices');
    }

    public function action_index()
    {
        Helper_Output::factory()->link_js('libs/jquery.validate.min')
                                ->link_js('admin/notices/index')
                                ;
        $data['active_notices']     = ORM::factory('Notice')->get_all_notices(1);
        $data['non_active_notices'] = ORM::factory('Notice')->get_all_notices(0);
        $this->setTitle('Notices')
                ->view('admin/notices/index', $data)
                ->render();
    }
    
    public function action_add()
    {
        $post   = Helper_Output::clean($this->request->post());
        $notice = ORM::factory('Notice')->create_notice($post);
        $users  = ORM::factory('User')->find_all();
        foreach ($users as $user) {
            $user->add('notices', ORM::factory('Notice')->where('id', '=', $notice->id)->find());
        }
        Helper_Jsonresponse::render_json('success', null, array(
                                                                'type' => $notice->type,
                                                                'text' => $notice->text,
                                                                'id'   => $notice->id
        ));
    }
    
    public function action_change_status()
    {
        ORM::factory('Notice')->where('id', '=', $this->request->post('id'))->find()->values(array('status' => $this->request->post('status')), array('status'))->update();
        Helper_Jsonresponse::render_json('success', null, $this->request->post());
    }
    
    public function action_delete()
    {
        ORM::factory('Notice', $this->request->post('id'))->delete();
//        Helper_Jsonresponse::render_json('success', null, $this->request->post());
    }

} 