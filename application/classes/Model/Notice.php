<?php defined('SYSPATH') OR die('No direct access allowed.');

class Model_Notice extends ORM {

    protected $_has_many = array(
            'users' => array('model' => 'User','through' => 'users_notices'),
    );
    
    public function create_notice($notice)
    {
        return $this->values($notice, array('type', 'text'))->save();
    }
    
    public function get_all_notices($status)
    {
        return $this->where('status', '=', $status)->find_all();
    }
} 
