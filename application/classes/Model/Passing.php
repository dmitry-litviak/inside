<?php defined('SYSPATH') OR die('No direct access allowed.');

class Model_Passing extends ORM {

    public function create_passing($user_id, $days, $type)
    {
        return $this->values(array('user_id' => $user_id, 'days' => $days, 'type' => $type), array('user_id', 'days', 'type'))->save();
    }
    
    public function get_passing($user_id, $flag)
    {
        $passings = $this->where('user_id', '=', $user_id);
        if ($flag) {
            $passings = $passings->where('check', '!=', 1);
        }
        return $passings->find_all();
    }
} 