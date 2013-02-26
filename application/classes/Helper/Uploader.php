<?php
class Helper_Uploader
{
    static public function createTempIfNotExist(){
        $dir = Kohana::$config->load('config')->get('files_dir');
        if(!is_dir($dir))
            mkdir($dir, 0777);
    }
    
    static public function replaceAvatarImage($file, $user, $crop)
    {
        ini_set('memory_limit', '-1');
        if (!$file) 
            return $file;
        $place_upload_dir = Kohana::$config->load('config')->get('user_files') . $user->id . '/avatar/';
        
        if(!is_dir($place_upload_dir))
            mkdir($place_upload_dir, 0777, true);
        
         $drop_path = explode('/', $file);
         $file_name = end($drop_path);
         $target    = $place_upload_dir . $file_name;
         if ($target == $file) 
             return $file_name;
         $old               = Kohana::$config->load('config')->get('user_files') . $user->id . '/avatar/' . $user->avatar;
         $old_file_original = Kohana::$config->load('config')->get('user_files') . $user->id . '/avatar/original_' . $user->avatar;
         $old_file_medium   = Kohana::$config->load('config')->get('user_files') . $user->id . '/avatar/medium_' . $user->avatar;
         $old_file_small    = Kohana::$config->load('config')->get('user_files') . $user->id . '/avatar/small_' . $user->avatar;
         rename($file, $target);
         if ($crop) {
            $cropper = json_decode($crop);
            
            $image = Image::factory($target)->crop($cropper->width, $cropper->height, (int)$cropper->x, (int)$cropper->y);
            $image->save($place_upload_dir . 'original_' . $file_name);
            
            $image_small = Image::factory($target)->crop($cropper->width, $cropper->height, (int)$cropper->x, (int)$cropper->y)->resize(80, 80);
            $image_small->save($place_upload_dir . 'small_' . $file_name);
            
            $image_medium =  Image::factory($target)->crop($cropper->width, $cropper->height, (int)$cropper->x, (int)$cropper->y)->resize(206, 206);
            $image_medium->save($place_upload_dir . 'medium_' . $file_name);
            
            @unlink($old_file_original); 
            @unlink($old_file_medium); 
            @unlink($old_file_small);
            @unlink($old);
         }
         return $file_name;
    }
        
}