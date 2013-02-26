<?php defined('SYSPATH') OR die('No direct access allowed.');
/**
 * Default auth user
 *
 * @package    Kohana/Auth
 * @author     Kohana Team
 * @copyright  (c) 2007-2012 Kohana Team
 * @license    http://kohanaframework.org/license
 */
class Model_Auth_User extends ORM {

	/**
	 * A user has many tokens and roles
	 *
	 * @var array Relationhips
	 */
	protected $_has_many = array(
		'user_tokens'  => array('model' => 'User_Token'),
		'roles'        => array('model' => 'Role', 'through' => 'roles_users'),
                'notices'      => array('model' => 'Notice', 'through' => 'users_notices'),
                'certificates' => array('model' => 'Certificate', 'through' => 'certificates_feeds'),
                'feeds'        => array('model' => 'feed'),
                'passings'     => array('model' => 'Passing'),
	);
        
        protected $_belongs_to = array(
		'level'   => array('model' => 'Level'),
                'enlevel' => array('model' => 'Enlevel'),
	);

	/**
	 * Rules for the user model. Because the password is _always_ a hash
	 * when it's set,you need to run an additional not_empty rule in your controller
	 * to make sure you didn't hash an empty string. The password rules
	 * should be enforced outside the model or with a model helper method.
	 *
	 * @return array Rules
	 */
	public function rules()
	{
		return array(
			'username' => array(
				array('not_empty'),
				array('max_length', array(':value', 32)),
				array(array($this, 'unique'), array('username', ':value')),
			),
			'password' => array(
				array('not_empty'),
			),
                        'email' => array(
				array('not_empty'),
				array('email'),
				array(array($this, 'unique'), array('email', ':value')),
			),
		);
	}

	/**
	 * Filters to run when data is set in this model. The password filter
	 * automatically hashes the password when it's set in the model.
	 *
	 * @return array Filters
	 */
	public function filters()
	{
		return array(
			'password' => array(
				array(array(Auth::instance(), 'hash'))
			),
                        'hire_date'=> array(
                            array('Helper_Output::timestampForDB'),
                        ),
		);
	}

	/**
	 * Labels for fields in this model
	 *
	 * @return array Labels
	 */
	public function labels()
	{
		return array(
			'username'         => 'username',
			'password'         => 'password',
		);
	}

	/**
	 * Complete the login for a user by incrementing the logins and saving login timestamp
	 *
	 * @return void
	 */
	public function complete_login()
	{
		if ($this->_loaded)
		{
			// Update the number of logins
			$this->logins = new Database_Expression('logins + 1');

			// Set the last login date
			$this->last_login = time();

			// Save the user
			$this->update();
		}
	}

	/**
	 * Tests if a unique key value exists in the database.
	 *
	 * @param   mixed    the value to test
	 * @param   string   field name
	 * @return  boolean
	 */
	public function unique_key_exists($value, $field = NULL)
	{
		if ($field === NULL)
		{
			// Automatically determine field by looking at the value
			$field = $this->unique_key($value);
		}

		return (bool) DB::select(array(DB::expr('COUNT(*)'), 'total_count'))
			->from($this->_table_name)
			->where($field, '=', $value)
			->where($this->_primary_key, '!=', $this->pk())
			->execute($this->_db)
			->get('total_count');
	}

	/**
	 * Allows a model use both email and username as unique identifiers for login
	 *
	 * @param   string  unique value
	 * @return  string  field name
	 */
	public function unique_key($value)
	{
		return Valid::email($value) ? 'email' : 'username';
	}

	/**
	 * Password validation for plain passwords.
	 *
	 * @param array $values
	 * @return Validation
	 */
	public static function get_password_validation($values)
	{
		return Validation::factory($values)
			->rule('password', 'min_length', array(':value', 6));
	}

	/**
	 * Create a new user
	 *
	 * Example usage:
	 * ~~~
	 * $user = ORM::factory('User')->create_user($_POST, array(
	 *	'username',
	 *	'password',
	 *	'email',
	 * );
	 * ~~~
	 *
	 * @param array $values
	 * @param array $expected
	 * @throws ORM_Validation_Exception
	 */
	public function create_user($values, $expected)
	{
		// Validation for passwords
		$extra_validation = Model_User::get_password_validation($values)
			->rule('password', 'not_empty');

		return $this->values($values, $expected)->create($extra_validation);
	}

	/**
	 * Update an existing user
	 *
	 * [!!] We make the assumption that if a user does not supply a password, that they do not wish to update their password.
	 *
	 * Example usage:
	 * ~~~
	 * $user = ORM::factory('User')
	 *	->where('username', '=', 'kiall')
	 *	->find()
	 *	->update_user($_POST, array(
	 *		'username',
	 *		'password',
	 *		'email',
	 *	);
	 * ~~~
	 *
	 * @param array $values
	 * @param array $expected
	 * @throws ORM_Validation_Exception
	 */
	public function update_user($values, $expected = NULL)
	{
		if (empty($values['password']))
		{
			unset($values['password'], $values['password_confirm']);
		}

		// Validation for passwords
		$extra_validation = Model_User::get_password_validation($values);

		return $this->values($values, $expected)->update($extra_validation);
	}
        
        public function get_certificates($user_id)
        {
            return DB::select('*')->from('users_certificates_feeds')
                                  ->join('certificates')->on('certificates.id', '=', 'users_certificates_feeds.certificate_id')
                                  ->where('user_id', '=', $user_id)
                                  ->as_object()
                                  ->execute();
        }
        
        public function get_achievments($user_id)
        {
            return DB::select('*')->from('users_achievments')
                        ->join('achievments')->on('achievments.id', '=', 'users_achievments.achievment_id')
                        ->where('user_id', '=', $user_id)
                        ->as_object()
                        ->execute();
        }
        
        public function get_list($limit, $offset, $dev_type = 'all_dev', $pr_type = 'all_pr')
        {                
            $users = $this;
            if ($dev_type != 'all_dev') {
                $users = $users->where('level_id', '=', $dev_type);
            }
            
            if ($pr_type != 'all_pr') {
                $users = $users->where('pr_type', '=', $pr_type);
            }
            
            $users = $users->order_by('level_id', 'DESC')->find_all();
            $result = array();
            foreach ($users as $key => $user) {
                $result[$key]['avatar']  = Helper_User::get_avatar_url($user, 'small_');
                $result[$key]['name']    = $user->first_name . ' ' . $user->last_name;
                $result[$key]['english'] = Helper_User::get_english_level($user->enlevel_id);
                $result[$key]['skype']   = $user->skype;
                $result[$key]['email']   = $user->email;
                $result[$key]['twitter'] = $user->twitter;
                $result[$key]['phone']   = $user->phone;
                $result[$key]['role']    = $user->level->title . ' ' . $user->devrole;
                $result[$key]['level']   = $user->level_id; 
                $certificates = $cert = DB::select('*')->from('users_certificates_feeds')->where('user_id', '=', $user->id)->execute();
                $result[$key]['certificates'] = array();
                foreach ($certificates as $cert) {
                    $result[$key]['certificates'][] = ORM::factory('Certificate', $cert['certificate_id'])->title . ' (' . $cert['score'] .')';
                }
                
            }
            return $result;
        }
        
} // End Auth User Model
