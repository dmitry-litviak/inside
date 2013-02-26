<?php
class Helper_Dashboard
{
    static function getBadgeClass($status)
    {
        switch ($status){
            case ('add'):
                return 'label-success';
                break;
            case ('pass_achievment'):
                return 'label-important'; 
                break;
            case ('pass_certificate'):
                return 'label-info'; 
                break;
            default :
                return 'label-warning'; 
                break;
        }
    }

}