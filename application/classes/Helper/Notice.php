<?php
class Helper_Notice
{
    static function getStatusTitle($status)
    {
        switch ($status){
            case ('success'):
            return 'Good news!'; break;
            case ('error'):
            return 'Oh snap!'; break;
            case ('info'):
            return 'Heads up!'; break;
            default :
            return 'Holy guacamole!'; break;
        }
    }

    static function get_notices($flag = true)
    {         
        $notices = DB::select('*')->from('notices')
                                  ->join('users_notices', 'LEFT')
                                  ->on('notices.id', '=', 'users_notices.notice_id')
                                  ->where('notices.status', '=', 1)
                                  ->where('users_notices.user_id', '=', Auth::instance()->get_user()->id)
                                  ;
        if ($flag) {
            $notices = $notices->where('users_notices.check', '!=', 1);
        }
        $notices = $notices->as_object()->execute()->as_array();
        if (!empty($notices)) 
            foreach ($notices as $notice) {
                echo '<div data-type="common" ' . 'data-id="' . $notice->id . '" class="alert alert-' . $notice->type . '"><button type="button" class="close" data-dismiss="alert">×</button><strong>' . self::getStatusTitle($notice->type) . '</strong> ' . $notice->text . '</div>';
            }
    }
}