<?php defined('SYSPATH') OR die('No direct access allowed.');

class Model_Achievment extends ORM {

    protected $_belongs_to = array(
            'level'  => array('model' => 'Level'),
    );
    
    public function create_list($user_id)
    {
        $achievments = ORM::factory('Achievment')->find_all();
        foreach ($achievments as $achievment) {
            DB::insert('users_achievments', array('user_id', 'achievment_id', 'check'))->values(array($user_id, $achievment->id, 0))->execute();
        }
    }
    
    public function clear_list($user_id)
    {
        DB::update('users_achievments')
                ->set(array('check' => 0))
                ->where('user_id', '=', $user_id)
                ->execute();
    }
    
    public function create_achievments_for_users($achievments, $user_id)
    {
        $this->clear_list($user_id);
        if (empty($achievments)) $achievments = array();
        foreach ($achievments as $level => $achievment) {
            foreach ($achievment as $key => $achievment_id) {
                DB::update('users_achievments')
			->set(array('user_id' => $user_id, 'achievment_id' => $achievment_id, 'check' => 1))
			->where('achievment_id', '=', $achievment_id)
                        ->where('user_id', '=', $user_id)
			->execute();
            }
        }
    }

} 
