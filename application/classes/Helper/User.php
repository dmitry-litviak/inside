<?php
class Helper_User
{
    private static $_day = 86400;
    
    static function get_avatar_url($user, $parameter)
    {   
        if (!empty($user->avatar)) {
            return URL::site(Kohana::$config->load('config')->get('user_files') . $user->id . '/avatar/'. $parameter . $user->avatar);
        } else {
            return URL::site("/images/avatars/blank_avatar.png");
        }
    }
    
    static function check_achievments($achievments, $id)
    {
        foreach ($achievments as $achievment) {
            if ($achievment->id == $id && $achievment->check) return true;
        }
        return false;
    }
    
    static function get_english_level($level)
    {
        switch ($level) {
            case 1:
                return 'Basic';
                break;
            case 2:
                return 'Pre-intermediate';
                break;
            case 3:
                return 'Intermediate';
                break;
            case 4:
                return 'Upper-intermediate';
                break;
            case 5:
                return 'Advanced';
                break;
        }
    }
    
    static function get_high_level()
    {
        $id = Auth::instance()->get_user()->level_id;
        if ($id < 3) {
            return ORM::factory('Level', $id + 1)->title;
        }
    }
        
    static function get_passing($user, $flag = true)
    {
        $passings = ORM::factory('Passing')->get_passing($user->id, $flag);
        foreach ($passings as $passing) {
            if ($passing->type == 'company') {
                $title = ORM::factory('Level', $user->level_id + 1)->title;
                $flag = $user->level_id != 3;
            } else {
                $title = ORM::factory('Enlevel', $user->enlevel_id + 1)->title;
                $flag = $user->enlevel_id != 5;
            }
            if ($passing->days == 0 && $flag) {
                $message = 'You can pass '. $title . ' ' . $passing->type  . ' test now';
                echo '<div class="alert alert-success" data-id="' . $passing->id . '" data-type="passing"><button type="button" class="close" data-dismiss="alert">×</button><strong>Good news!</strong> '.$message.'</div>';
            } elseif ($passing->days > 0 && $flag) {
                $time_of_update = strtotime($passing->time);
                $current_time  = time();
                $diff = $current_time - $time_of_update;
                $diff_in_days = abs(round($diff / self::$_day));

                if ($diff_in_days >= $passing->days ) {
                    $passing->values(array('days' => 0, 'time' => date('Y-m-d H:i:s', time())))->update();
                    $message = 'You can pass '. $title .' ' . $passing->type . ' test now';
                    echo '<div class="alert alert-success" data-id="' . $passing->id . '" data-type="passing"><button type="button" class="close" data-dismiss="alert">×</button><strong>Good news!</strong> '.$message.'</div>';
                } else {
                    $message = 'You can pass '. $title . ' ' . $passing->type  . ' test in ' . ($passing->days - $diff_in_days) . ' days ';
                    echo '<div class="alert alert-warning" data-id="' . $passing->id . '" data-type="passing"><button type="button" class="close" data-dismiss="alert">×</button><strong>Attention,</strong> '.$message.'</div>';
                }
            }
        }
    }
    
    static  function get_passing_without_echo($user, $type)
    {
        $passing = ORM::factory('Passing')->where('user_id', '=', $user->id)->where('type', '=', $type)->find();
        if ($passing->type == 'company') {
            $flag = $user->level_id != 3;
        } else {
            $flag = $user->enlevel_id != 5;
        }
        if ($passing->days > 0 && $flag) {
            $time_of_update = strtotime($passing->time);
            $current_time  = time();
            $diff = $current_time - $time_of_update;
            $diff_in_days = abs(round($diff / self::$_day));
            if ($diff_in_days >= $passing->days ) {
                $passing->values(array('days' => 0, 'time' => date('Y-m-d H:i:s', time())))->update();
            } else {
                return $passing->days - $diff_in_days;
            }
        }
        return $passing->days;
    }


    static function get_purposes()
    {
        $user = Auth::instance()->get_user();
        if ($user->level_id < 3) {
            $passed_achievments = DB::select('achievment_id')->from('users_achievments')
                                          ->where('user_id', '=', $user->id)
                                          ->as_object()
                                          ->execute();
            $passed = array();
            foreach ($passed_achievments as $achieve) {
               $passed[] = $achieve->achievment_id; 
            }
            
            $achievments = DB::select('*')->from('users_achievments')
                                                              ->join('achievments')->on('achievments.id', '=', 'users_achievments.achievment_id')
                                                              ->where('achievments.level_id', '=', $user->level_id + 1)
                                                              ->where('users_achievments.user_id', '=', $user->id)->as_object()->execute();
//            $achievments = ORM::factory('Achievment')->join('users_achievments','INNER')
//                                                ->on('achievment.id','=','users_achievments.achievment_id')
//                                                ->where('achievment.level_id', '=', $user->level_id + 1)
//                                                ->find_all();
//                                             Helper_Main::print_flex($achievments);die;
            foreach ($achievments as $achievment) {
                $class = "";
                if (in_array($achievment->id, $passed) && $achievment->check) {
                    $class = 'class="done"';
                }
                echo '<li '. $class . '>'. $achievment->title .'</li>';
            }
        } 
    }
    
}
