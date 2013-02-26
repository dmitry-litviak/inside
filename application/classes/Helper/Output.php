<?php
class Helper_Output
{
	protected static $_css 		= array();
	protected static $_js 		= array();
	protected static $_csspath	= 'css/';
	protected static $_jspath	= 'js/';
	protected static $_errors	= array();

	public static function factory() 
	{
		return new Helper_Output();
	}

	public function link_css($css)
	{
		self::$_css[] = $css;
		return $this;
	}

	public function link_js($js)
	{
		self::$_js[] = $js;
		return $this;
	}

	public static function renderCss()
	{
		if(!empty(self::$_css)) {
			foreach (self::$_css as $key => $value) {

				$http = substr($value, 0, 4);
				if($http == 'http') {
					echo '<link rel="stylesheet" type="text/css" href="'. $value .'" />';
				} else {
					echo '<link rel="stylesheet" type="text/css" href="'. URL::base( ) . self::$_csspath . $value .'.css" />';
				}

				
			}
		}
	}

	public static function renderJS()
	{
		if(!empty(self::$_js)) {
			foreach (self::$_js as $key => $value) {
				$http = substr($value, 0, 4);
				if($http == 'http') {
					echo '<script type="text/javascript" src="'. $value .'" /></script>';
				} else {
					echo '<script type="text/javascript" src="'. URL::base( ) . self::$_jspath . $value .'.js" ></script>';
				}
			}
		}
	}

	/*
	* @param Array $errors
	*/
	public static function addErrors($errors)
	{
		if(!is_array($errors) && $errors) {
			$errors = array($errors);
		}

		if($errors) {
			self::$_errors = array_merge(self::$_errors, $errors);
		}
	}

	public static function keepErrors()
	{
		$session = Session::instance();
		$session->set('errors', self::$_errors);
		
	}

	public static function getErrors()
	{
		// $session = Session::instance();
		// self::addErrors($session->get_once('errors'));
		return self::$_errors;
	}

	public static function renderErrors()
	{
		$session = Session::instance();
		self::addErrors($session->get_once('errors'));

		if(!empty(self::$_errors)) {
			echo '<div class="alert alert-error">';
			foreach (self::$_errors as $key => $value) {
				if(is_array($value)) {
					foreach ($value as $key2 => $value2) {
						echo "<p>" . Helper_Output::getErrorByCode($value2) . "</p>";
					}
				} else {
					echo "<p>" . Helper_Output::getErrorByCode($value) . "</p>";
				}
			}
			echo '</div>';
		}
	}

	public static function set_flashData($alias, $data)
	{
		Session::instance()->set($alias, $data);
	}

	public static function flashData($alias)
	{
		return Session::instance()->get_once($alias);
	}
        
        public static function siteDate($date) {
            if($date == '0000-00-00 00:00:00' || !$date) {
                    return date(Kohana::$config->load('config')->get('date_format'), time());
            } else {
                    return DateTime::CreateFromFormat('Y-m-d H:i:s', $date)->format(Kohana::$config->load('config')->get('date_format'));
            }
	}
        
        public static function timestampForDB ($date) 
        {
            
            if($date == '00-00-0000' || !$date) {
                    return date('Y-m-d H:i:s', time());
            } else {
                    return DateTime::CreateFromFormat(Kohana::$config->load('config')->get('date_format'), $date)->format('Y-m-d H:i:s');
            }
        }
        
        public static function get_date_interval($vacation)
        {
            $day_start   = strlen($vacation->day_start) != 2 ? '0'.$vacation->day_start : $vacation->day_start;
            $day_end     = strlen($vacation->day_end ) != 2 ? '0'.$vacation->day_end  : $vacation->day_end;
            $month_start = strlen($vacation->month_start) != 2 ? '0'.$vacation->month_start : $vacation->month_start;
            $month_end   = strlen($vacation->month_end ) != 2 ? '0'.$vacation->month_end  : $vacation->month_end;
            return $day_start . '/' . $month_start . ' - ' . $day_end . '/' . $month_end;
        }
        
        public static function xss_clean($str)
        {
            return htmlspecialchars(stripslashes($str));
        }
        
        public static function clean($post) {
            $arr = $post;
            foreach ($arr as &$value)
            {
                if (is_array($value)){
                    $value = self::clean($value);
                } else {
                    if(!get_magic_quotes_gpc()) {
                        $value = addslashes($value);
                    }
                    $value = strip_tags(htmlspecialchars(stripslashes($value)));
                }
            }
            return $arr;
        }

}