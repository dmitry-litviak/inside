<?php defined('SYSPATH') OR die('No direct access allowed.');

class Model_Vacation extends ORM {

    protected $_belongs_to = array(
            'user'  => array('model' => 'User'),
    );
    
    public function create_vacations($vacations, $user_id)
    {
//        Helper_Main::print_flex($vacations);die;
        if (!empty($vacations['day_start'])) {
            DB::delete($this->_table_name)
                            ->where('user_id', '=', $user_id)
                            ->where('year', '=', $vacations['year'])
                            ->execute();
            foreach ($vacations['day_start'] as $key => $vacation) {
                $insert_array = array(
                                        'user_id'     => $user_id,
                                        'day_start'   => $vacations['day_start'][$key],
                                        'month_start' => $vacations['month_start'][$key],
                                        'day_end'     => $vacations['day_end'][$key],
                                        'month_end'   => $vacations['month_end'][$key],
                                        'year'        => $vacations['year']
                                    );
                DB::insert('vacations', array('user_id', 'day_start', 'month_start', 'day_end', 'month_end', 'year'))->values($insert_array)->execute();
            }
        }
    }
    
    public function get_years()
    {
        $years = DB::select('year')->distinct(TRUE)->from('vacations')->order_by('year')->execute()->as_array();
        $last  = end($years);
        $years[]['year'] = $last['year'] + 1;
        return $years;
    }
} 