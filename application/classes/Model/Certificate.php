<?php defined('SYSPATH') OR die('No direct access allowed.');

class Model_Certificate extends ORM {

    public function create_certificates($certificates, $user_id)
    {
        $tests_number = count($certificates['title']);
        for ($i = 0; $i < $tests_number; $i++) {
            if (empty($certificates['id'][$i])) {
                $feed        = ORM::factory('Feed')->values(array('type' => 'pass_certificate', 'user_id' => $user_id), array('type', 'user_id'))->save();
                $certificate = ORM::factory('Certificate')->where('title', '=', $certificates['title'][$i])->find();
                if (empty($certificate->id)) {
                    $certificate = ORM::factory('Certificate')->values(array('title'  => $certificates['title'][$i]), array('title'))->save();
                }
                DB::insert('users_certificates_feeds', array('user_id', 'certificate_id', 'feed_id', 'score'))->values(array($user_id, $certificate->id, $feed->id, $certificates['score'][$i]))->execute();
            }
        }
    }
} 