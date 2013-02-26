<?php defined('SYSPATH') or die('No direct script access.');

class Controller_Users extends My_LoggedUserController {

        public function before()
	{
		parent::before();
                Helper_MainMenuHelper::setActiveItem('edit_page');
	}
        
	public function action_edit()
	{
             Helper_Output::factory()
                        ->link_js('libs/jquery-ui-1.9.2.custom.min')
                        ->link_js('libs/jquery.fileupload')
                        ->link_js('libs/jquery.fileupload-ui')
                        ->link_js('libs/jquery.fileupload-fp')
                        ->link_js('libs/jquery.Jcrop.min')
                        ->link_js('libs/jquery.form')
                        ->link_js('libs/jquery.validate.min')
                        ->link_js('public/assets/workspace')
                        ->link_js('users/edit')
                        ->link_css('errors')
                        ->link_css('jquery.Jcrop')
                        ->link_css('blockUI')
                        ;
            $data['user']           = $this->logget_user;
            $data['avatar']         = Helper_User::get_avatar_url($data['user'], 'medium_');
            $data['avatar_hidden']  = Kohana::$config->load('config')->get('user_files') . $data['user']->id . '/avatar/' . $data['user']->avatar;
            if ($this->request->post()) {
                $post = Helper_Output::clean($this->request->post());
                try {
                    $user = ORM::factory('User', $this->logget_user->id);
                    if ($post['password']['old']) {
                        if (Auth::instance()->check_password($post['password']['old'])) {
                            $user->update_user(array('password' => $post['password']['new'], 'password_confirm' => $post['password']['new']), array('password'));
                        } else {
                            throw new Exception("Password error");
                        }
                    }
                    $user->update_user($post['user']);
                    $user->update_user(array('avatar' => Helper_Uploader::replaceAvatarImage($post['avatar']['avatar'], $user, $this->request->post('avatar.crop_avatar'))));
                    Helper_Jsonresponse::render_json('success', null, array(
                    'avatar'        => Helper_User::get_avatar_url($user, 'medium_'),
                        'avatar_hidden' => Kohana::$config->load('config')->get('user_files') . $data['user']->id . '/avatar/' . $user->avatar,
                        'url'           => URL::site('uploader/temp')
                    ));
                }
                catch (ORM_Validation_Exception $e) {
                    Helper_Jsonresponse::render_json('error', $e, null);
                }
                catch (Exception $e) {
                    Helper_Jsonresponse::render_json('error', $e->getMessage(), null);
                }
            }
 
            $this->setTitle('Edit Page')
                    ->view('users/edit', $data)
                    ->render();
	}
        
        public function action_check_notice()
        {
            if ($this->request->post('type') == "common") {
                DB::update('users_notices')
                        ->set(array('check' => 1))
                        ->where('user_id', '=', $this->logget_user->id)
                        ->where('notice_id', '=', $this->request->post('id'))
                        ->execute();
            } else {
                ORM::factory('Passing')->where('id', '=', $this->request->post('id'))->find()->values(array("check" => 1))->update();
            }
            
            Helper_Jsonresponse::render_json('success', null, array());
        }

} 