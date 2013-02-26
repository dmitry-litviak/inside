<?php defined('SYSPATH') or die('No direct script access.');

class Controller_Session extends My_UserController {

        public function before()
	{
		parent::before();
                Helper_Display::instance()
                    ->displayAll(false)
                ;
	}
        
	public function action_index()
	{
            if (Auth::instance()->logged_in()) {
                    return $this->redirect('dashboard');
            }

            if ($this->request->post()) {
                $status = Auth::instance()->login($this->request->post('username'), $this->request->post('password'));

                if ($status && Auth::instance()->get_user()->status) {
                    $this->redirect('dashboard');
                } else {
                    Helper_Alert::setStatus('error');
                    Helper_Alert::set_flash('Failed login');
                }
            }  
            $this->setTitle('Login')
                    ->view('session/index')
                    ->render();
	}
        
        public function action_logout()
        {
            if (Auth::instance()->logout()) {
                return $this->redirect('');
            } else {
                    Helper_Alert::setStatus('error');
                    Helper_Alert::set_flash('Failed logout');
            }
        }
        
        public function action_register()
        {
            if ($this->request->post()) {
                $model = ORM::factory('User');
                $model->values(array(
                    'username'         => $this->request->post('username'),
                    'password'         => $this->request->post('password')
                ));
                try {
                    $model->save();
                    $model->add('roles', ORM::factory('Role')->where('name', '=', 'login')->find());
                    $this->redirect('session');
                }
                catch (ORM_Validation_Exception $e) {
                    echo $e;
                }
            }
            $this->setTitle('Login')
                    ->view('session/register')
                    ->render();
        }
        
        public function action_forgot()
        {
            Helper_Output::factory()
                    ->link_js('libs/jquery.validate.min')
                    ->link_js('session/forgot');
            if ($this->request->post()) {
                try {
                    $user = ORM::factory('User')->where('email', '=', $this->request->post())->find();
                    if (!$user->id) throw new Exception(Kohana::$config->load('messages')->get('forgot_email'));
                    $user->values(array('hash' => Auth::instance()->hash($user->email . time())))->update();
                    $data['recovery_url'] = URL::site('session/recovery/' . $user->hash);
                    Library_Mail::factory()->setFrom(array('0' => 'noreply@lodoss.org'))->setTo(array('0' => $this->request->post('email')))->setSubject('Email Recovery')->setView('mail/recovery', $data)->send();
                    Helper_Alert::setStatus('success');
                    Helper_Alert::set_flash(Kohana::$config->load('messages')->get('forgot_email_sent'));
                }
                catch (Exception $e) {
                    Helper_Alert::setStatus('error');
                    Helper_Alert::set_flash($e->getMessage());
                }
            }
            $this->setTitle('Forgot password')
                    ->view('session/forgot')
                    ->render();
        }
        
        public function action_recovery()
        {
            Helper_Output::factory()
                    ->link_js('libs/jquery.validate.min')
                    ->link_js('session/recovery');
            $user = ORM::factory('User')->where('hash', '=', $this->request->param('id'))->find();
            if (!$user->id) {
                $this->redirect();
            }
            if ($this->request->post()) {
                try {
                    if ($this->request->post('new') != $this->request->post('new_confirm')) throw new Exception(Kohana::$config->load('messages')->get('confirm_password'));
                    $user->values(array('hash' => NULL))->update();
                    $user->update_user(array('password' => $this->request->post('new'), 'password_confirm' => $this->request->post('new_confirm')), array('password'));
                    $this->redirect();
                }
                catch (ORM_Validation_Exception $e) {
                    Helper_Alert::setStatus('error');
                    Helper_Alert::set_flash($e->getMessage());
                }
            }
            $this->setTitle('Password Recovery')
                    ->view('session/recovery')
                    ->render();
        }

} 
