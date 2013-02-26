<?php defined('SYSPATH') or die('No direct script access.');

class Controller_Admin_Settings extends My_AdminController {

    public function before()
    {
            parent::before();
            Helper_MainMenuHelper::setActiveItem('settings');
    }

    public function action_index()
    {
        Helper_Output::factory()
            ->link_js('libs/jquery.form')
            ->link_js('libs/jquery.validate.min')
            ->link_js('libs/jquery.blockUI')
            ->link_js('libs/underscore-min')
            ->link_js('libs/jquery.tagsinput.min')
            ->link_js('admin/settings/index')
            ->link_css('jquery.tagsinput')
            ->link_css('blockUI')
            ;
        
        if ($this->request->post('time')) {
            try {
                $times = $this->request->post('time');
                foreach ($times as $key => $time) {
                    ORM::factory('Level')->where('id', '=', $key + 1)->find()->values(array("days" => $time))->update();
                }
            } catch (ORM_Validation_Exception $e) {
                Helper_Alert::setStatus('error');
                Helper_Alert::set_flash($e->errors('Level'));
            }
        }
        if ($this->request->post('en_time')) {
            try {
                $times = $this->request->post('en_time');
                foreach ($times as $key => $time) {
                    ORM::factory('Enlevel')->where('id', '=', $key + 1)->find()->values(array("days" => $time))->update();
                }
            } catch (ORM_Validation_Exception $e) {
                Helper_Alert::setStatus('error');
                Helper_Alert::set_flash($e->errors('Enlevel'));
            }
        }
        if ($this->request->post('emails')) {
            try {
                $emails = explode(',', $this->request->post('emails'));
                ORM::factory('Mailer')->recreate($emails);
            } catch (ORM_Validation_Exception $e) {
                Helper_Alert::setStatus('error');
                Helper_Alert::set_flash($e->errors('Mailer'));
            }
        }
        $emails = ORM::factory('Mailer')->get_emails();
        $data['emails']   = implode(',', $emails['emails']);
        $data['enlevels'] = ORM::factory('Enlevel')->find_all();
        $data['levels']   = ORM::factory('Level')->find_all();
        $this->setTitle('Settings')
                ->view('admin/settings/index', $data)
                ->render();
    }
} 