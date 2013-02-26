<?php defined('SYSPATH') or die('No direct script access.');

class Controller_Admin_Employees extends My_AdminController {

    public function before()
    {
            parent::before();
            Helper_MainMenuHelper::setActiveItem('employees');
    }

    public function action_index()
    {
        Helper_Output::factory()
                        ->link_js('admin/employees/index')
                        ;
 
        $data['users'] = ORM::factory('User')->order_by('status', 'DESC')->find_all();
        $data['logget_user'] = $this->logget_user;
        $this->setTitle('Employees')
                ->view('admin/employees/index', $data)
                ->render();
    }

    public function action_add()
    {
        Helper_Output::factory()
                        ->link_js('libs/jquery-ui-1.9.2.custom.min')
                        ->link_js('libs/jquery.fileupload')
                        ->link_js('libs/jquery.fileupload-ui')
                        ->link_js('libs/jquery.fileupload-fp')
                        ->link_js('libs/jquery.Jcrop.min')
                        ->link_js('libs/jquery.validate.min')
                        ->link_js('libs/bootstrap-datepicker')
                        ->link_js('admin/employees/add')
                        ->link_css('jquery.Jcrop')
                        ->link_css('datepicker')
                        ->link_css('common')
                        ;
        $data['pm']                 = $this->request->param('id');
        $data['middle_achievments'] = ORM::factory('Achievment')->where('level_id', '=', 2)->find_all();
        $data['senior_achievments'] = ORM::factory('Achievment')->where('level_id', '=', 3)->find_all();
        $data['user']               = ORM::factory('User')->where('id', '=', $this->request->param('id'))->find();
        $data['certificates']       = ORM::factory('User')->get_certificates($data['user']->id);
        $data['achievments']        = ORM::factory('User')->get_achievments($data['user']->id);
        $data['enlevels']           = ORM::factory('Enlevel')->find_all();
        $data['avatar']             = Helper_User::get_avatar_url($data['user'], 'medium_');
        $data['avatar_hidden']      = $data['user']->id ? Kohana::$config->load('config')->get('user_files') . $data['user']->id . '/avatar/' . $data['user']->avatar : "";;

        if ($this->request->post()) {
            $user_model = ORM::factory('User');
            $user_model->values($this->request->post('user'));
            try {
                $user_model->save();
                $user_model->update_user(array('avatar' => Helper_Uploader::replaceAvatarImage($this->request->post('avatar.avatar'), $user_model, $this->request->post('avatar.crop_avatar'))), array('avatar'));
                $user_model->add('roles', ORM::factory('Role')->where('name', '=', 'login')->find());
                
                ORM::factory('Feed')->values(array('type' => 'add', 'user_id' => $user_model->id, 'level' => $user_model->level_id), array('type', 'user_id', 'level'))->save();
                
                ORM::factory('Certificate')->create_certificates($this->request->post('certificates'), $user_model->id);
                
                if ($this->request->param('id') != 'project_manager') {
                    ORM::factory('Achievment')->create_list($user_model->id);
                    ORM::factory('Achievment')->create_achievments_for_users($this->request->post('achievments'), $user_model->id);
                    ORM::factory('Passing')->create_passing($user_model->id, ORM::factory('Level', $user_model->level_id)->days, 'company');
                }
                
                ORM::factory('Passing')->create_passing($user_model->id, ORM::factory('Enlevel', $user_model->enlevel_id)->days, 'english');
                $this->redirect('admin/employees');
            }
            catch (ORM_Validation_Exception $e) {
                Helper_Alert::setStatus('error');
                Helper_Alert::set_flash( Kohana::$config->load('messages')->get('create_error'));
                $this->redirect($this->request->referrer());
            }
        }
        $this->setTitle('Add User')
                ->view('admin/employees/add', $data)
                ->render();
    }
    
    public function action_edit()
    {
        Helper_Output::factory()
                        ->link_js('libs/jquery-ui-1.9.2.custom.min')
                        ->link_js('libs/jquery.fileupload')
                        ->link_js('libs/jquery.fileupload-ui')
                        ->link_js('libs/jquery.fileupload-fp')
                        ->link_js('libs/jquery.Jcrop.min')
                        ->link_js('libs/jquery.validate.min')
                        ->link_js('libs/bootstrap-datepicker')
                        ->link_js('admin/employees/add')
                        ->link_js('admin/employees/vacation')
                        ->link_css('jquery.Jcrop')
                        ->link_css('datepicker')
                        ;
        $data['middle_achievments'] = ORM::factory('Achievment')->where('level_id', '=', 2)->find_all();
        $data['senior_achievments'] = ORM::factory('Achievment')->where('level_id', '=', 3)->find_all();
        $data['user']               = ORM::factory('User')->where('id', '=', $this->request->param('id'))->find();
        $data['certificates']       = ORM::factory('User')->get_certificates($data['user']->id);
        $data['achievments']        = ORM::factory('User')->get_achievments($data['user']->id);
        $data['enlevels']           = ORM::factory('Enlevel')->find_all();
        $data['avatar']             = Helper_User::get_avatar_url($data['user'], 'medium_');
        $data['avatar_hidden']      = $data['user']->id ? Kohana::$config->load('config')->get('user_files') . $data['user']->id . '/avatar/' . $data['user']->avatar : "";
        $data['next_exam_english']  = Helper_User::get_passing_without_echo($data['user'], 'english');
        $data['next_exam_company']  = Helper_User::get_passing_without_echo($data['user'], 'company');
        $prev_level                 = $data['user']->level_id;
        $prev_enlevel               = $data['user']->enlevel_id;
        $data['pm']                 = $prev_level == 4 ? true : false;
        $data['years']              = ORM::factory('Vacation')->get_years();
        $data['vacations']          = ORM::factory('Vacation')->where('user_id', '=', $data['user']->id)->where('year', '=', date("Y"))->find_all();
        if ($this->request->post()) {
            try {
//                Helper_Main::print_flex($this->request->post());die;
                $user = ORM::factory('User', $this->request->post('user.id'));
                $user->update_user($this->request->post('user'));
                $user->update_user(array('avatar' => Helper_Uploader::replaceAvatarImage($this->request->post('avatar.avatar'), $user, $this->request->post('avatar.crop_avatar'))));
                
                if ($user->level_id > $prev_level) {
                    ORM::factory('Feed')->values(array('type' => 'level_up', 'user_id' => $user->id), array('type', 'user_id'))->save();
                    if (!$data['pm']) {
                        ORM::factory('Passing')->where('type', '=', 'company')->where('user_id', '=', $user->id)->find()->values(array('days' => ORM::factory('Level', $user->level_id)->days))->update();
                    }
                }
                
                if ($user->enlevel_id != $prev_enlevel) {
                    ORM::factory('Passing')->where('type', '=', 'english')->where('user_id', '=', $user->id)->find()->values(array('days' => ORM::factory('Enlevel', $user->enlevel_id)->days))->update();
                }
                
                ORM::factory('Certificate')->create_certificates($this->request->post('certificates'), $user->id);
                
                if (!$data['pm']) {
                    ORM::factory('Achievment')->create_achievments_for_users($this->request->post('achievments'), $user->id);
                }
                
                
                ORM::factory('Vacation')->create_vacations($this->request->post('vacation'), $user->id);

                $this->redirect('admin/employees');
            }
            catch (ORM_Validation_Exception $e) {
                Helper_Alert::setStatus('error');
                Helper_Alert::set_flash($e);
            }
        }
        
        $this->setTitle('Edit User')
                ->view('admin/employees/add', $data)
                ->render();   
    }
       
    public function action_delete_certificate()
    {
        $row = DB::select('*')->from('users_certificates_feeds')->where('user_id', '=', $this->request->post('user_id'))->where('certificate_id', '=', $this->request->post('id'))->as_object()->execute()->current();
        $feed = ORM::factory('Feed', $row->feed_id);
        //исправить
        DB::query(Database::DELETE, 'DELETE FROM users_certificates_feeds WHERE user_id = '.$this->request->post('user_id').' AND certificate_id='.$this->request->post('id'))->execute();
        if(!empty($feed->id)) $feed->delete();
        Helper_Jsonresponse::render_json('success', null, $this->request->post());
    }

    public function action_delete_employee()
    {
        ORM::factory('User', $this->request->post('id'))->delete();
        Helper_Jsonresponse::render_json('success', null, $this->request->post());
    }
    
    public function action_update_passing()
    {
        $user = ORM::factory('User', $this->request->post('user_id'));
        if ($this->request->post('type') == "company" && $user->level_id < 3) {
            $days = ORM::factory('Level', $user->level_id)->days;
            ORM::factory('Passing')->where('type', '=', $this->request->post('type'))->where('user_id', '=', $this->request->post('user_id'))->find()->values(array('days' => $days, 'time' => date('Y-m-d H:i:s', time())))->update();
        } elseif ($user->enlevel_id < 5) {
            $days = ORM::factory('Enlevel', $user->enlevel_id)->days;
            ORM::factory('Passing')->where('type', '=', $this->request->post('type'))->where('user_id', '=', $this->request->post('user_id'))->find()->values(array('days' => $days, 'time' => date('Y-m-d H:i:s', time())))->update(); 
        }
        Helper_Jsonresponse::render_json('success', null, $days);
    }
    
    public function action_change_role()
    {
        $user = ORM::factory('User', $this->request->post('user_id'));
        $user->remove('roles');
        if ($this->request->post('id') == 2) {
            $user->add('roles', ORM::factory('Role')->where('name', '=', 'login')->find());
            $user->add('roles', ORM::factory('Role')->where('name', '=', 'admin')->find());    
        } else {
            $user->add('roles', ORM::factory('Role')->where('name', '=', 'login')->find());
        }
        Helper_Jsonresponse::render_json('success', null, $this->request->post());
    }
    
    public function action_ajax_check_username()
    {
        echo ORM::factory('User')->where('username', '=', $this->request->post('username'))->find()->id ? 0 : 1;
    }
    
    public function action_ajax_check_email()
    {
        echo ORM::factory('User')->where('email', '=', $this->request->post('email'))->find()->id ? 0 : 1;
    }
    
    
    public function action_change_status()
    {
        $user = ORM::factory('User', $this->request->post('user_id'));
        $user->values(array('status' => abs($user->status - 1)))->update();
        Helper_Jsonresponse::render_json('success', null, array('status' => $user->status));
    }
    
    //-------------------------------Developer functions-------------------------------------------  
    public function action_modify_users()
    {
        $users = ORM::factory('User')->find_all();
        foreach ($users as $user) {
            $passings = ORM::factory('Passing')->where('user_id', '=', $user->id)->find_all();
            if ($passings->count() == 0) {
                if ($user->level_id != 4) {
                    ORM::factory('Passing')->create_passing($user->id, ORM::factory('Level', $user->level_id)->days, 'company');
                }
                ORM::factory('Passing')->create_passing($user->id, ORM::factory('Enlevel', $user->enlevel_id)->days, 'english');
            }
        }
        echo "Исполнено!";
    }
    
    public function action_modify_achievments()
    {
        $users = ORM::factory('User')->find_all();
        foreach ($users as $user) {
            ORM::factory('Achievment')->create_list($user->id);
        }
        echo "Исполнено!";
    }
    
    public function action_test()
    {
        var_dump(Date::hours());
        Helper_Main::print_flex(Date::months(Date::MONTHS_SHORT));die;
    }
    
    //--------------------------------------------------------------------------------------------
    
    public function action_get_year_vacations()
    {
        $vacations = ORM::factory('Vacation')->where('user_id', '=', $this->request->post('user_id'))->where('year', '=', $this->request->post('year'))->find_all();
        Helper_Jsonresponse::render_json('success', null, View::factory('admin/employees/partials/vacation')->set('vacations', $vacations)->render());
    }
    
    public function action_get_months_list()
    {
        Helper_Jsonresponse::render_json('success', null, array('days' => Date::days($this->request->post('month'))));
    }
    
    public function action_delete_vacation()
    {
        DB::delete('vacations')
                ->where('id', '=', $this->request->post('id'))
                ->execute();
        Helper_Jsonresponse::render_json('success', null, array());
    }
    
} 