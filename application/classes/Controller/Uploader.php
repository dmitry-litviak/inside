<?php defined('SYSPATH') or die('No direct script access.');

class Controller_Uploader extends My_LoggedUserController 
{
        static $validate_array = array("jpg", "jpeg", "png", "gif");
        public function action_temp(){
            
                if(!empty($_FILES)){
                        $uploaddir = Kohana::$config->load('config')->get('temp_dir');
                        if(!is_dir($uploaddir))
                            mkdir($uploaddir, 0777);
                        
                        $file       = $_FILES['file'];
                        $info       = pathinfo($file['name']);
                        $name       = time().'.'.$info['extension'];
                        if (in_array($info['extension'], self::$validate_array) && exif_imagetype($_FILES['file']['tmp_name']) != '') {
                            $uploadfile = $uploaddir.$name;

                            move_uploaded_file($file['tmp_name'], $uploadfile);
                            chmod($uploadfile, 0777);

                            Helper_Jsonresponse::render_json('success', null, $uploadfile);
                        } else {
                            Helper_Jsonresponse::render_json('error', null, null);
                        }
                }
                
        }
    
}