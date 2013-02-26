<table class="table table-bordered">
    <thead>
    <tr>
        <th>Employees</th>
        <?php foreach (Date::months(Date::MONTHS_SHORT) as $month): ?>
            <th><?php echo $month ?></th>
        <?php endforeach; ?>
    </tr>
    </thead>
    <tbody>
        <?php foreach ($users as $user): ?>
            <?php $vacations = ORM::factory('Vacation')->where('user_id', '=', $user->id)->where('year', '=', $year)->find_all(); ?>
            <?php if (count($vacations)): ?>
                <tr>
                    <td><?php echo $user->first_name . ' ' . $user->last_name ?></td>
                    <?php for ($i = 1; $i <= 12; $i++): ?>
                        <?php foreach ($vacations as $key => $vacation): ?>
                            <?php if ($vacation->month_start == $i): ?>
                                <?php if ($vacation->month_end == $vacation->month_start): ?>
                                    <td class="vac" ><?php echo Helper_Output::get_date_interval($vacation) ?></td>
                                <?php else: ?>
                                    <td colspan="2" class="vac" ><?php echo Helper_Output::get_date_interval($vacation) ?></td>
                                    <?php $i++ ?>
                                <?php endif; ?>
                                <?php break; ?>
                            <?php else: ?>
                                <?php if ($key == count($vacations) - 1): ?> 
                                    <td></td>
                                <?php endif; ?>
                            <?php endif; ?>
                        <?php endforeach; ?>
                    <?php endfor; ?>
                </tr>
            <?php endif; ?>
        <?php endforeach; ?>
    </tbody>
</table>
