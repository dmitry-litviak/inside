<?php
class Helper_Main
{
	static function print_flex($data = '')
	{
		echo "<pre>";
		print_r($data);
		echo "</pre>";
	}
        
        
    static function hightLight($what, $where) {
            return str_replace($what, "<b>" . $what . "</b>", $where);
    }
    
    static function changeDateFormat($date){
      $newDate = date_parse_from_format(Kohana::$config->load('config')->get('date.format'), $date);
      return $newDate['year'].'-'.$newDate['month'].'-'.$newDate['day'];
    }
    
    static function checkExistsAndRemoveFile($file){
        if(file_exists($file)){
            @unlink ($file);
        }
    }
    
    public static function getTempDir()
    {
        $tempDir = Kohana::$config->load('config')->get('temp_dir');
        if( !is_dir($tempDir) ){
          mkdir($tempDir, 0777);
        }
        
        return $tempDir;
    }

    static function unlinkRecursive($dir, $deleteRootToo) 
    { 
        if(!$dh = @opendir($dir)) 
            return;
        
        while (false !== ($obj = readdir($dh))) 
        { 
            if($obj == '.' || $obj == '..') 
            { 
                continue; 
            } 

            if (!@unlink($dir . '/' . $obj)) 
            { 
                self::unlinkRecursive($dir.'/'.$obj, true); 
            } 
        } 

        closedir($dh); 

        if ($deleteRootToo) 
        { 
            @rmdir($dir); 
        } 

        return; 
      } 
      
      static function dateDiffInDays($day1, $month1, $day2, $month2, $year)
      {
//         return abs(strtotime($year . '-' . $month1 . '-' . $day1) - strtotime($year . '-' . $month2 . '-' . $day2)) / (60 * 60 * 24); 
        $datetime1 = new DateTime($year . '-' . $month1 . '-' . $day1);
        $datetime2 = new DateTime($year . '-' . $month2 . '-' . $day2);
        $interval = $datetime1->diff($datetime2);
        return $interval->d;
      }
}


class Helper_AdminSiteBar
{
  
    static public $items = array();
    
    static public function init($array = array())
    {
            if(!empty($array)) {
                
                    foreach ($array as $key=>$item) {
                            $obj = new stdClass();
                            $obj->title 	= isset($item['title'])   ? $item['title']          : '';
                            $obj->url 		= isset($item['url'])     ? URL::site($item['url']) : '#';
                            $obj->status	= isset($item['status'])  ? $item['status']         : '';
                            $obj->icon          = isset($item['icon'])    ? $item['icon']           : '';
                            $obj->status        = isset($item['status'])  ? $item['status']         : 0;
                            self::addItem($key, $obj);
                    }
            }
    }
    
    static public function addItem($index = "", stdClass $item)
    {
            if($index != "") {
                    self::$items[$index] = $item;
            }
    }
    
    
    static function setActiveItem($alias)
    {
            if(!empty(self::$items)) {
                    foreach (self::$items as $key=> $item) {
                            if($key != $alias) {
                                    self::$items[$key]->status = 0;
                            } else {
                                    self::$items[$key]->status = 1;
                            }
                    }
            }
    }
  
  
    public static function render(){
      if(!empty(self::$items)) {
          $html = '<ul class="nav nav-list">';
            foreach (self::$items as $key=>$value) {
                  if($value->status == 1)
                    $html .= '<li class="active"><a href="'.$value->url.'"><i class="'.$value->icon.'"></i>'.$value->title.'</a></li>';
                  else
                    $html .= '<li ><a href="'.$value->url.'"><i class="'.$value->icon.'"></i>'.$value->title.'</a></li>';
            }
            $html .= '</ul>';
          echo $html;
        }
    }
    
  
}

