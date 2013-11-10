<?php
class Library_Mail {
    private $_to      = array('admin@inside.org' => 'Admin');
    private $_from    = array('admin@inside.org' => 'Admin');
    private $_subject = 'Hi';
    private $_headers = '';
    
    public function __construct() {
//        $email_to  = ORM::factory('Setting')->getByKey("requests_email");
//        $this->_to = array($email_to->value => $email_to->value2);
    }
    
    public static function factory(){
        return new Library_Mail();
    }
    
    public function setView($view, $data){
        $this->_message = View::factory($view)->set('obj', $data)->render();
        return $this;
    }
    
    public function setSubject($subject){
        $this->_subject = $subject;
        return $this;
    }
    
    public function setTo($to){
        $this->_to = $to;
        return $this;
    }
    
    public function setFrom($from){
        $this->_from = $from;
        return $this;
    }
    
    private function _prepareHeaders(){
        $this->_headers  = 'MIME-Version: 1.0' . "\r\n";
        $this->_headers .= 'Content-type: text/html; charset=utf-1251' . "\r\n";
        $this->_headers .= 'To: '.$this->_to[key($this->_to)].' <'.key($this->_to).'>' . "\r\n";
        $this->_headers .= 'From: '.$this->_from[key($this->_from)].' <'.key($this->_from).'>' . "\r\n";
    }
    
    public function send(){
        $this->_prepareHeaders();
        return mail($this->_to[key($this->_to)], '=?UTF-8?B?' . base64_encode($this->_subject) . '?=', $this->_message, $this->_headers);
    }
}