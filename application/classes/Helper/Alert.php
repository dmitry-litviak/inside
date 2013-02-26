<?php
class Helper_Alert
{
        static $status = 'success';
        static $strong = 'Good news!';
          
        static function setStatus($status)
        {
            self::$status = $status;
            
            switch ($status){
              case ('success'):
                self::$strong = 'Good news!'; break;
              case ('error'):
                self::$strong = 'Oh snap!'; break;
              case ('info'):
                self::$strong = 'Heads up!'; break;
              default :
                self::$strong = 'Good news!'; break;
            }
        }
        
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
        
        static function get_flash()
        {         $message = Session::instance()->get_once('message');
                  if(!empty($message))
                    echo '<div class="alert alert-'.self::$status.'"><button type="button" class="close" data-type="common" data-dismiss="alert">×</button><strong>'.self::$strong.'</strong> '.$message.'</div>';
        }

        static function set_flash($message)
        {
            Session::instance()->set('message', $message);
        }
        
        static function set_flash_form($message)
        {
            Session::instance()->set('form', $message);
        }
        
        static function get_flash_form()
        {         $message = Session::instance()->get_once('form');
                  if(!empty($message))
                    echo '<div class="alert alert-'.self::$status.'">'.$message.'</div>';
        }
}