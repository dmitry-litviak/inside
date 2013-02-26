<?php defined('SYSPATH') OR die('No direct access allowed.');

class Helper_MainMenuHelper
{
    static public $items = array();
	
    static public function init($array = array())
    {
            if(!empty($array)) {
                    foreach ($array as $key=>$item) {
                            $obj = new stdClass();
                            $obj->name 		= isset($item['name'])    ? $item['name']            : '';
                            if ($obj->name == "Documents") {
                                $obj->url = isset($item['url']) ? $item['url'] : '#';
                            } else {
                                $obj->url = isset($item['url']) ? URL::base().$item['url'] : '#';
                            }
                            $obj->status 	= isset($item['status'])  ? $item['status']          : 0;
                            $obj->icon = $item['icon'];
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
    
    static function deactivateAllItems()
    {       
        if(!empty(self::$items)) {
            foreach (self::$items as $key=> $item) {
                self::$items[$key]->status = 0;

            }
        }   
    }
    
    
    static function render()
    {
        if(!empty(self::$items)) 
        {
          $html = '<ul class="nav nav-list">';
          foreach (self::$items as $key=> $item) 
          {
                
                if($item->status == 0)
                {
                    $html .= '<li><a href="' . $item->url . '">' . $item->icon . $item->name . '</a></li>';
                    $html .= '</li>';
                } else {
                    $html .= '<li class="active" ><a  href="' . $item->url . '">' . $item->icon  . $item->name . '</a></li>';
                    $html .= '</li>';
                }
          }
          $html .=  '</ul>';
          echo $html;
       }
   }
    
}

    
    
?>