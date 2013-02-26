<?php defined('SYSPATH') OR die('No direct access allowed.');

class Model_Feed extends ORM {
    
    	protected $_has_many = array(
		'achievments'  => array('model' => 'Achievment', 'through' => 'users_achievments'),
                'certificates' => array('model' => 'Certificate', 'through' => 'users_certificates_feeds'),
//                'ausers'       => array('model' => 'User', 'through' => 'users_achievments_feeds', 'foreign_key' => 'feed_id', 'far_key' => 'achievment_id'),
//                'cusers'       => array('model' => 'User', 'through' => 'users_certificates_feeds', 'foreign_key' => 'feed_id', 'far_key' => 'certificate_id'),
	);
        
        protected $_belongs_to = array(
		'user'  => array('model' => 'User'),
 	);
        
        public function get_list($limit, $offset, $feed_type = 'all_feed', $pr_type = 'all_pr')
        {                        
            if ($feed_type == 'brainbench') {
                $feeds = $this->where('type', '=', 'pass_certificate');
            }
            if ($feed_type == 'internal') {
                $feeds = $this->where('type', '=', 'add');
            }
            if ($feed_type == 'enhance') {
                $feeds = $this->where('type', '=', 'level_up');
            }
            if ($feed_type == 'all_feed')
            {
                $feeds = $this;
            }
            $feeds = $feeds->order_by('time', 'DESC')->find_all();
            $result = array();
            foreach ($feeds as $key => $feed) {
                if ($feed->user->pr_type == $pr_type || $pr_type == 'all_pr') {
                    $result[$key]['name'] = $feed->user->first_name . ' ' . $feed->user->last_name;
                    $result[$key]['type'] = $feed->type;
                    $result[$key]['id']   = $feed->id;
                    switch ($feed->type) {
                        case 'pass_certificate':
                            $cert = DB::select('*')->from('users_certificates_feeds')->where('feed_id', '=', $feed->id)->execute()->current();
                            $result[$key]['icon'] = '<i class="icon-user"></i>';
                            $result[$key]['text'] = 'successfully passed ';
                            $result[$key]['info'] = 'Brainbench ' . $feed->certificates->find()->title . ' (' . $cert['score'] . ')';
                            $result[$key]['class'] = "info";
                            break;
                        case 'add':
                            $result[$key]['icon'] = '<i class="icon-plus"></i>';
                            $result[$key]['text'] = 'joined us as a ';
                            $result[$key]['info'] = ORM::factory('Level', $feed->level)->title . ' ' . $feed->user->devrole;
                            $result[$key]['class'] = "success";
                            break;
                        case 'level_up':
                            $result[$key]['icon'] = '<i class="icon-arrow-up"></i>';
                            $result[$key]['text'] = 'susseccfully passed all the tests and became a  ';
                            $result[$key]['info'] = $feed->user->level->title . ' ' . $feed->user->devrole;
                            $result[$key]['class'] = "warning";
                            break;
                        default:
                            break;
                    }
                }
            }
            return $result;
        }
        
        public function get_certificates()
        {
            $certificates = ORM::factory('Certificate')->find_all();
            $result = array();
            foreach ($certificates as $certificate) {
                $result[$certificate->title] = DB::select('*')->from('users_certificates_feeds')
                                                              ->join('users')->on('users.id', '=', 'users_certificates_feeds.user_id')
                                                              ->where('certificate_id', '=', $certificate->id)->order_by('score', 'DESC')->execute()->as_array();
            }
            return $result;
        }
                
} 