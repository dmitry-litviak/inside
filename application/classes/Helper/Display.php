<?php
/**
 * 
 * @author kurijov@gmail.com
 *
 */
class Helper_Display
{
	private $_availableWords	= array(
		'display', 
		'is'
	);
	
	private $_statements = array();
	
	private static $_instance;
	
	public function __call($method, $params)
	{
		$logicWord 	= '';
		foreach ($this->_availableWords as $word) {
			$wordPosition 	= strpos($method, $word);
			if ($wordPosition === 0) {
				$item = substr($method, strlen($word));
				$set 		= null;
				if (isset($params[0])) {
					$set = $params[0];
					$this->_word($word, $item, $set);
					return $this;
				} else					
					return $this->_word($word, $item, $set);
			}
		}
	}
	
	private function _word($word, $value, $set = null) 
	{
		$value = strtolower($value);
		
		if ($set === null) {
			if (isset($this->_statements[$word][$value])) {
				return $this->_statements[$word][$value];
			} else 
				return true;
		} else
			$this->_statements[$word][$value] = (bool) $set;
	}
	
	public function statements()
	{
		return $this->_statements;
	}
	
	/**
	 * @return DisplayHelper
	 */
	public static function instance()
	{
		if (self::$_instance == null)
			self::$_instance = new Helper_Display();
			
		return self::$_instance;
	}
}