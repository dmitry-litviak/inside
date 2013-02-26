<?php defined('SYSPATH') or die('No direct script access.');

class My_UserController extends My_Layout
{
	public function before()
	{
		parent::before();
                
		//choose main template
		$this->template = View::factory('layouts/main');
		//include common css js
		Helper_Output::factory()
                                        ->link_js('libs/jquey-1.8.2.min')
                                        ->link_js('libs/bootstrap.min')
                                        ->link_js('libs/underscore-min')
                                        ->link_js('libs/canvasloader-min')
                                        ->link_js('libs/jquery.blockUI')
                                        ->link_js('common')
                                        ->link_css('bootstrap.min')
                                        ->link_css('screen')
                                        ->link_css('common')
                                        ;
	}
        
}
