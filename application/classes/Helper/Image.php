<?php defined('SYSPATH') OR die('No direct access allowed.');

class Helper_Image
{
    private $m_SetImagesThumbSize = array( 'width' => 150, 'height' => 150 );
    /// categories sizes
    
    //Category: Set Images
    private $m_SetImageSizes = array(
        'col2' => array( 
            'landscape'         => array( 'width' => 150, 'height' => 82,  'tag' => array( 'width' => 50, 'height'=> 50), 'master' => Image::HEIGHT ), 
            'portrait'          => array( 'width' => 150, 'height' => 200, 'tag' => array( 'width' => 50, 'height'=> 50), 'master' => Image::HEIGHT ),
            'square'            => array( 'width' => 150, 'height' => 135, 'tag' => array( 'width' => 50, 'height'=> 50), 'master' => Image::HEIGHT ),
            'isDirCreated'      => false,
            'resultFileName'    => ''
         ),
        'col3' => array( 
            'landscape'         => array( 'width' => 242, 'height' => 143, 'tag' => array( 'width' => 50, 'height'=> 50),  'master' => Image::HEIGHT ), 
            'portrait'          => array( 'width' => 242, 'height' => 338, 'tag' => array( 'width' => 50, 'height'=> 50), 'master' => Image::HEIGHT ),
            'square'            => array( 'width' => 242, 'height' => 227, 'tag' => array( 'width' => 50, 'height'=> 50), 'master' => Image::HEIGHT ),
            'isDirCreated'      => false,
            'resultFileName'    => ''
         ),
        'col4' => array( 
            'landscape'         => array( 'width' => 334, 'height' => 204, 'tag' => array( 'width' => 50, 'height'=> 50), 'master' => Image::HEIGHT ), 
            'portrait'          => array( 'width' => 334, 'height' => 476, 'tag' => array( 'width' => 50, 'height'=> 50), 'master' => Image::HEIGHT ),
            'square'            => array( 'width' => 334, 'height' => 319, 'tag' => array( 'width' => 50, 'height'=> 50), 'master' => Image::HEIGHT ),
            'isDirCreated'      => false,
            'resultFileName'    => ''
         ),
        'col5' => array( 
            'landscape'         => array( 'width' => 426, 'height' => 266, 'tag' => array( 'width' => 50, 'height'=> 50), 'master' => Image::HEIGHT ), 
            'portrait'          => array( 'width' => 426, 'height' => 614, 'tag' => array( 'width' => 50, 'height'=> 50), 'master' => Image::HEIGHT ),
            'square'            => array( 'width' => 426, 'height' => 411, 'tag' => array( 'width' => 50, 'height'=> 50), 'master' => Image::HEIGHT ),
            'isDirCreated'      => false,
            'resultFileName'    => ''
         ),
        'col6' => array( 
            'landscape'         => array( 'width' => 518, 'height' => 312, 'tag' => array( 'width' => 50, 'height'=> 50), 'master' => Image::HEIGHT ), 
            'portrait'          => array( 'width' => 518, 'height' => 752, 'tag' => array( 'width' => 50, 'height'=> 50), 'master' => Image::HEIGHT ),
            'square'            => array( 'width' => 518, 'height' => 503, 'tag' => array( 'width' => 50, 'height'=> 50), 'master' => Image::HEIGHT ),
            'isDirCreated'      => false,
            'resultFileName'    => ''
         ),
        'col7' => array( 
            'landscape'         => array( 'width' => 610, 'height' => 388, 'tag' => array( 'width' => 50, 'height'=> 50), 'master' => Image::HEIGHT ), 
            'portrait'          => array( 'width' => 610, 'height' => 890, 'tag' => array( 'width' => 50, 'height'=> 50), 'master' => Image::HEIGHT ),
            'square'            => array( 'width' => 610, 'height' => 595, 'tag' => array( 'width' => 50, 'height'=> 50), 'master' => Image::HEIGHT ),
            'isDirCreated'      => false,
            'resultFileName'    => ''
         )
    );
    
    //Category: Avatars
    private $m_AvatarSizes = array(
        'avatar/big'            => array( 
            'landscape'         => array( 'width' => 152, 'height' => 154, 'master' => Image::WIDTH  ),
            'portrait'          => array( 'width' => 152, 'height' => 154, 'master' => Image::HEIGHT  ), 
            'square'            => array( 'width' => 152, 'height' => 154, 'master' => Image::WIDTH  ),
            'isDirCreated'      => false,
            'resultFileName'    => ''
        ),
        'avatar/medium'         => array( 
            'landscape'         => array( 'width' => 62, 'height' => 62, 'master' => Image::WIDTH  ),
            'portrait'          => array( 'width' => 62, 'height' => 62, 'master' => Image::HEIGHT  ), 
            'square'            => array( 'width' => 62, 'height' => 62, 'master' => Image::WIDTH  ),
            'isDirCreated'      => false,
            'resultFileName'    => ''
        ),
        'avatar/small'          => array( 
            'landscape'         => array( 'width' => 25, 'height' => 25, 'master' => Image::WIDTH  ),
            'portrait'          => array( 'width' => 25, 'height' => 25, 'master' => Image::HEIGHT  ), 
            'square'            => array( 'width' => 25, 'height' => 25, 'master' => Image::WIDTH  ),
            'isDirCreated'      => false,
            'resultFileName'    => ''
        ),
        'avatar/small16'          => array( 
            'landscape'         => array( 'width' => 16, 'height' => 16, 'master' => Image::WIDTH  ),
            'portrait'          => array( 'width' => 16, 'height' => 16, 'master' => Image::HEIGHT  ), 
            'square'            => array( 'width' => 16, 'height' => 16, 'master' => Image::WIDTH  ),
            'isDirCreated'      => false,
            'resultFileName'    => ''
        )
    );
    
    private $m_ImageInfo;
    private $m_ParentDir;
    private $m_SavedImagesInfo;
    private $orientation;
    private $toSaveSmall;
    private $m_UploadedImgFileFullPath;
    private $m_UploadedImgFile;
    private $m_SetId;
    private $m_OriginSrc;
    private $m_IsAtLeastOnePicSaved;
    private $_aspectRatios;

    
    public function __construct( $inImageInfo, $inUserId, $inSetId = false )
    {
        $this->m_ImageInfo              = $inImageInfo;
        $this->m_SetId                  = $inSetId;
        $this->m_IsAtLeastOnePicSaved   = false;
        
        
        if( is_string($inImageInfo) ){
            $this->m_OriginSrc = $inImageInfo;
        }
        else if( is_array($inImageInfo) ){
            $this->m_OriginSrc = $inImageInfo['src'];
        }
        
        if( !$inSetId ){
            //avatar is being uploaded
            $this->m_ParentDir  =  Kohana::$config->load('config')->get('user_files') .  $inUserId . "/";
            $this->createDirs( $this->m_ParentDir, $this->m_AvatarSizes );
        }
        else{ 
            $this->m_ParentDir  = Kohana::$config->load('config')->get('user_files') .  $inUserId . "/sets/$inSetId/";    
            $this->createDirs( $this->m_ParentDir, $this->m_SetImageSizes );
        }

        $m_SavedImagesInfo = array();   
        
//        $this->_aspectRatios = array();
//        $setImageSize = $this->m_SetImageSizes['col2'];
//        
//        $this->_aspectRatios['landscape']['w'] = $setImageSize['landscape']['width'] / $setImageSize['landscape']['height'];
//        $this->_aspectRatios['landscape']['h'] = $setImageSize['landscape']['height'] / $setImageSize['landscape']['width'];
//        $this->_aspectRatios['portrait']['w'] = $setImageSize['portrait']['width'] / $setImageSize['portrait']['height'];
//        $this->_aspectRatios['portrait']['h'] = $setImageSize['portrait']['height'] / $setImageSize['portrait']['width'];
//        
//        var_dump($this->_aspectRatios); die();
    }
    
    /*
     * Name: factory
     * Description: returns new instance of class
     */
    public static function factory( $inImageInfo, $inUserId, $inSetId = false )
    {
        return new Helper_Image( $inImageInfo, $inUserId, $inSetId );
    }
    
    
    /*
     * Name: resize
     * Description: resizes image to all necessary sizes
     */
    public function resize()
    {
        $imageWidth  = $this->m_ImageInfo['width'];
        $imageHeight = $this->m_ImageInfo['height'];
        $orientation = $this->getOrientation( $imageWidth, $imageHeight );
  
        //copy file from another server or from 'tmp' dir (if file is uploaded via regular form)  to user's dir
        $this->m_UploadedImgFile = $this->copyImageToUserDir( $this->m_ImageInfo['src'] );
        $this->m_UploadedImgFileFullPath = $this->m_ParentDir . $this->m_UploadedImgFile;
        
        //save not cropped but resized picture to show in single look
        $this->_savePicForSingleLook( $this->m_UploadedImgFileFullPath, $imageWidth, $imageHeight, $orientation );
  
        //we don't need to save pictures which are smaller then requested size
        $this->toSaveSmall = false;
        $this->resizeCategory( $imageWidth,  $this->m_SetImageSizes, $orientation );
        
        $this->createThumbs( $this->m_SetImageSizes, $this->m_SetImagesThumbSize['width'], 
                $this->m_SetImagesThumbSize['height'], $orientation );
        
        return $this;
    }
    
    
    /*
     * Name: saveInfo
     * Description: saves images info to DB
     */
    public function saveInfo()
    {
        
        if( $this->m_IsAtLeastOnePicSaved ){
            $setImages = ORM::factory( 'set_image' );
            $setImages->set_id        = $this->m_SetId;
            $setImages->origin_src    = $this->m_OriginSrc;
            $setImages->alt           = $this->m_SavedImagesInfo['alt'];
            $setImages->origin_width  = $this->m_SavedImagesInfo['origin_width'];
            $setImages->origin_height = $this->m_SavedImagesInfo['origin_height'];
            $setImages->orientation   = $this->m_SavedImagesInfo['orientation'];
            //$setImages->sizes         = serialize($this->m_SavedImagesInfo['sizes']);
            $setImages->name          = $this->m_SavedImagesInfo['name'];
            $setImages->date_created  = time();
            
            foreach( $this->m_SetImageSizes as $dirName => $dirInfo ){
                if(isset($this->m_SavedImagesInfo['sizes'][$dirName]) && is_array($this->m_SavedImagesInfo['sizes'][$dirName]) ){
                    $setImages->{$dirName} = serialize($this->m_SavedImagesInfo['sizes'][$dirName]);
                }
                else{
                    $setImages->{$dirName} = 0;
                }
            }
            return $setImages->create()->id;
        }
        else{
            return false;
        }
    }
    
    
    
    /**
     * Name: resizeAvatar
     * Description: resizes avatar
     */
     public function resizeAvatar( )
    {
        //copy file from another server or from 'tmp' dir (if file is uploaded via regular form)  to user's dir
        $this->m_UploadedImgFile            = $this->copyImageToUserDir( $this->m_ImageInfo );
        $this->m_UploadedImgFileFullPath    = $this->m_ParentDir .  $this->m_UploadedImgFile;
        $this->toSaveSmall                  = true;

        $image = Image::factory( $this->m_UploadedImgFileFullPath );
        $orientation = $this->getOrientation( $image->width, $image->height );
        
        $this->resizeCategory( $image->width, $this->m_AvatarSizes, $orientation );
        @unlink( $this->m_UploadedImgFileFullPath );
        
        return array( 'shorFileName' => $this->m_UploadedImgFile, 
            'link' => Helper_Main::getTempDir() . 
                      "/avatar/big/" . $this->m_UploadedImgFile  );
 
    }
    
    public function deleteAvatars( $inFileName )
    {
        foreach( $this->m_AvatarSizes as $dirName => &$dirInfo ){ 
            $fileToBeDeleted = $this->m_ParentDir . $dirName . "/" . $inFileName;
            @unlink( $fileToBeDeleted );
            
        }
    }
    
    /***************************************************************************************************************************
     *                                             PRIVATE FUNCTIONS
     ***************************************************************************************************************************/
    
    /**
     * Categories: set image, avatar 
     */
    private function resizeCategory( $inOriginImageWidth, &$inCategoryInfo, $inOrientation ){
                
        //resize original image to all neccessary sizes
        foreach( $inCategoryInfo as $dirName => &$dirInfo ){
                  
            $savedFileFullPath = $this->m_ParentDir . $dirName . "/" . $this->m_UploadedImgFile;

           // $this->m_SavedImagesInfo['sizes'][$dirName ]['isSaved'] = false;
            if( $dirInfo['isDirCreated'] ){
                  
                $sizes = $dirInfo[ $inOrientation ];
                
                $colRatioW = $sizes['width'] / $sizes['height'];
                $colRatioH = $sizes['height'] / $sizes['width'];
                $croppedByRatioImage = $this->_cropByAspectRatio( $this->m_UploadedImgFileFullPath, $colRatioW, $colRatioH );
                
                $image = Image::factory( $croppedByRatioImage );
//                $image = Image::factory( $this->m_UploadedImgFileFullPath );
                
                //resize and save only images which have width >= than current neccessary width 
                if( $inOriginImageWidth >= $sizes['width'] ){

                    $image->resize( $sizes['width'], $sizes['height'], $sizes['master'] );                   
                    $image->save( $savedFileFullPath );
                    
                    $this->m_IsAtLeastOnePicSaved = true;
                    
                    $dirInfo['resultFileName'] = $savedFileFullPath;
                    
                    $imageRealWidth     = $image->width;
                    $imageRealHeight    = $image->height;
                    $this->setSavedInfo( $dirName, $imageRealWidth, $imageRealHeight, $inOrientation);
                    
                }
                else{
                    if( $this->toSaveSmall ){
                        $image->resize( $sizes['width'], $sizes['height'], $sizes['master'] ); 
                        $image->save( $savedFileFullPath );
                        
                        //$this->m_SavedImagesInfo[$dirName ]['isSaved'] = true;
                        $imageRealWidth     = $image->width;
                        $imageRealHeight    = $image->height;
                        $this->setSavedInfo( $dirName,  $imageRealWidth, $imageRealHeight, $inOrientation);
                        
                        $dirInfo['resultFileName'] = $savedFileFullPath;
                    }                    
                }
                unlink( $croppedByRatioImage );
            }
 
        }
    }
   
    private function setSavedInfo( $inDirName, $inWidth, $inHeight, $inOrientation )
    {
        //$this->m_SavedImagesInfo['sizes'][$inDirName ]['isSaved'] = true;
        $this->m_SavedImagesInfo['sizes'][$inDirName ]['w']   = $inWidth;
        $this->m_SavedImagesInfo['sizes'][$inDirName ]['h']   = $inHeight;
        
        if(is_array( $this->m_ImageInfo ) ){
          $this->m_SavedImagesInfo['alt']           = @$this->m_ImageInfo['alt'];
          $this->m_SavedImagesInfo['origin_width']  = @$this->m_ImageInfo['width'];
          $this->m_SavedImagesInfo['origin_height'] = @$this->m_ImageInfo['height'];
        }
        $this->m_SavedImagesInfo['orientation']   = $inOrientation;
        $this->m_SavedImagesInfo['name']          = $this->m_UploadedImgFile;
        
    }
            
    /*
     * Name: getOrientation
     * Description: determines image's orientation
     */
    private function getOrientation( $inWidth, $inHeight )
    {
        
        if( $inWidth > $inHeight ){
            $orientation = 'landscape';
        }
        else if( $inWidth < $inHeight ){
            $orientation = 'portrait';
        }
        else{
            $orientation = 'square';
        }
        
        return $orientation;
    }
    
    /*
     * Name: createDirs
     * Description: creates all necessary dirs where images will be stored
     */
    private function createDirs( $inParentDir, &$ioCategoryInfo )
    {

        foreach( $ioCategoryInfo as $dirName => &$value ){
            
            $currentDir =  $inParentDir . "/" . $dirName;
//echo "$currentDir \n";
            if( !is_dir( $currentDir  ) ){
                if( @mkdir( $currentDir, 0777, true ) ){
                    $value['isDirCreated'] = true;
                }
                else{
                    $value['isDirCreated'] = false;
                }
            }
            else{
                $value['isDirCreated'] = true;
            }
        }
    }
    
    /*
     * Name: copyImageToUserDir
     * Description: copies image from remote server or from local 'tmp' dir (if regular files uploading is performed)
     */
    private function copyImageToUserDir( $inImageSrc )
    {
        
        
        //destination file
        $uniqueFileName = md5( time() . $inImageSrc ) . ".jpg";
        
        $uploadedImgFile = $this->m_ParentDir . "/" . $uniqueFileName;
        
            
        //check if file is remote
        if( preg_match("/^http:/i", $inImageSrc ) || preg_match("/^https:/i", $inImageSrc ) ){
            //file is on server
            
            //if file is this server it means that it is in tmp dir
            if( preg_match("/^" . addcslashes( URL::base(), "/" ) . "/i", $inImageSrc ) ){
              $imageSrcPath = Helper_Main::getTempDir() . basename($inImageSrc);
            }
            else{
              $imageSrcPath = $inImageSrc;
            }
            
            //get file content
            $originFileContent = file_get_contents( $imageSrcPath );

            file_put_contents( $uploadedImgFile, $originFileContent );
            if( file_exists( $uploadedImgFile ) ){
                return $uniqueFileName;
            }
        }
        else{
            //file is in local directory
            if( copy( $inImageSrc, $uploadedImgFile ) ){
                return $uniqueFileName;
            }
        }
        
        return false;
    }
  
    private function createThumbs( $inCategoryInfo, $inWidth, $inHeight, $inOrientation )
    {
        foreach( $inCategoryInfo as $dirName => &$dirInfo ){
            $sizes = $dirInfo[ $inOrientation ];
            
            if( ($sizes['width'] >= $inWidth) && ($sizes['height'] >= $inHeight) ){
                if( file_exists( $dirInfo['resultFileName'] ) ){
                    $fileToBeCroppedFullPath    = $dirInfo['resultFileName'];
                    $thumbsDir                  = $this->m_ParentDir . 'thumbs/';
                    $fileInfo                   = pathinfo($fileToBeCroppedFullPath);
                    $resultFile                 = $thumbsDir . $fileInfo['basename'];

                    
                    Helper_Main::createDirIfNotExists( $thumbsDir );
                    
                    Library_Opticrop::factory($fileToBeCroppedFullPath, $inWidth, $inHeight)->
                            doCrop()->
                            save( $resultFile );
                            
//                    Kohana_Image::factory( $fileToBeCroppedFullPath )
//                            ->crop($inWidth, $inHeight)
//                            ->save( $resultFile );
                    return;
                }
            }
            
        }
    }
    
    public static function prepareObjectForImagesUploader($uploadfile)
    {
        $sizes = getimagesize($uploadfile);
        $object    = new stdClass();
        $object->w = $sizes[0];
        $object->h = $sizes[1];
        $object->src = URL::site(substr($uploadfile, 2));
        return $object;
    }
    
    private function _cropByAspectRatio( $inImage, $inColRatioW, $inColRatioH )
    {
      list($realWidth, $realHeigth) = getimagesize($inImage);
      $realRatio = $realWidth / $realHeigth;

      if( $realRatio > $inColRatioW ){
        $width  = $realHeigth * $inColRatioW;
        $height = $realHeigth; 
      }
      else if($realRatio < $inColRatioW){
        $width  = $realWidth;
        $height = $realWidth * $inColRatioH; 
      }
      else{
        $width  = $realWidth;
        $height = $realHeigth; 
      }
      
      $pathParts = pathinfo($inImage); 
      $resultFile = $pathParts['dirname'] . '/cropped_' . $pathParts['basename'];
      Library_Opticrop::factory($inImage, $width, $height)->
                            doCrop()->
                            save( $resultFile );
      
      return $resultFile;
      
    }
    
    private function _savePicForSingleLook( $inImage, $inOriginWidth, $inOriginHeight, $inOrientation )
    {
      $pathParts = pathinfo($inImage); 
      $savedFileFullPath = $pathParts['dirname'] . '/single_' . $pathParts['basename'];
      
      $resizeMaster = Image::HEIGHT;
      if( $inOrientation == 'landscape' ){
        $resizeMaster = Image::WIDTH;
      }
        
      $targetSizes = $this->m_SetImageSizes['col7'][ $inOrientation ];
      if( ($targetSizes['width'] < $inOriginWidth) && ($targetSizes['height'] < $inOriginHeight) ){
        $image = Image::factory( $inImage );
        $image->resize( $targetSizes['width'], $targetSizes['height'], $resizeMaster ); 
       
        $image->save( $savedFileFullPath );
      }
      else{
        copy($inImage, $savedFileFullPath);
      }
    }
}

?>
