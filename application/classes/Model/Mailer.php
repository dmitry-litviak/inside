<?php defined('SYSPATH') OR die('No direct access allowed.');

class Model_Mailer extends ORM {
    
    public function get_emails()
    {
        $mails = DB::select('*')->from('mailers')->execute();
        $result = array();
        foreach ($mails as $mail)
        {
            $result['emails'][] = $mail['email'];
            $result['ids'][]    = $mail['id'];
        }
        return $result;
    }
    
    public function recreate($emails)
    {
        DB::query(Database::DELETE, "TRUNCATE TABLE `$this->_table_name`")->execute();
        foreach ($emails as $email) {
           DB::insert($this->_table_name, array('email'))->values(array($email))->execute(); 
        }
    }
} 