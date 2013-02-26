<?php defined('SYSPATH') or die('No direct script access.');

class Controller_Cron extends My_UserController {

        public function before()
	{
		parent::before();
	}
        
	public function action_index()
	{
            $mails = ORM::factory('Mailer')->find_all();
            $vacations = ORM::factory('Vacation')->find_all();
            foreach ($vacations as $key => $vacation) {
                if (Helper_Main::dateDiffInDays(date('d'), date('m'), $vacation->day_start, $vacation->month_start, $vacation->year) == 14) {
                    $data['message'] = 'Работнику ' . $vacation->user->first_name . ' ' . $vacation->user->last_name . ' необходимо предоставить отпуск с ' . $vacation->day_start . '.' . $vacation->month_start . '.' . $vacation->year . ' по ' . $vacation->day_end . '.' . $vacation->month_end . '.' . $vacation->year;              
                    Library_Mail::factory()->setFrom(array('0' => 'noreply@lodoss.org'))->setTo(array('0' => $vacation->user->email))->setSubject('Отпуск')->setView('mail/vacation', $data)->send();
                    foreach ($mails as $mail) {
                        Library_Mail::factory()->setFrom(array('0' => 'noreply@lodoss.org'))->setTo(array('0' => $mail->email))->setSubject('Отпуск')->setView('mail/vacation', $data)->send();
                    }
                }
            }
	}

} 
