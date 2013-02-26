<?php 
class Helper_Jsonresponse
{
	protected static $text          = "success";
	protected static $errors	=  array();
	protected static $data		=  array();

	public static function addError($error) 
	{
		self::$errors[] = $error;

	}

	public static function addText($text) 
	{
		self::$text = $text;

	}

	public static function addData($data) 
	{
		self::$data = $data;

	}

	public static function render()
	{
		header('Content-type: application/json');
		echo json_encode(array(
				'text' 		=> self::$text,
				'errors'	=> self::$errors,
				'data'		=> self::$data
			));
		die();
	}
        
        public static function render_json($result, $errors = null, $data = null)
        {
                header('Content-type: application/json');
                echo json_encode(array(
                    'text'      => $result,
                    'errors'    => $errors,
                    'data'	=> $data
                ));
                die;
        }
}