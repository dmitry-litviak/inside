<?php foreach ($vacations as $vacation): ?>
    <p>
        C
        <select name="vacation[day_start][]" class="day-select begin">
            <?php foreach(Date::days($vacation->month_start) as $day): ?>
                <option value="<?php echo $day ?>" <?php echo $day == $vacation->day_start ? 'selected' : '' ?> ><?php echo strlen($day) == 2 ? $day : '0' . $day ?></option>
            <?php endforeach; ?>
        </select>
        <select name="vacation[month_start][]" class="month-select begin">
            <?php foreach(Date::months(Date::MONTHS_LONG) as $key => $month): ?>
                <option value="<?php echo $key ?>" <?php echo $key == $vacation->month_start ? 'selected' : '' ?> ><?php echo $month ?></option>
            <?php endforeach; ?>
        </select>
        ПО
        <select name="vacation[day_end][]" class="day-select end">
            <?php foreach(Date::days($vacation->month_end) as $day): ?>
                <option value="<?php echo $day ?>" <?php echo $day == $vacation->day_end ? 'selected' : '' ?> ><?php echo strlen($day) == 2 ? $day : '0' . $day ?></option>
            <?php endforeach; ?>
        </select> 
        <select name="vacation[month_end][]" class="month-select end">
            <?php foreach(Date::months(Date::MONTHS_LONG) as $key => $month): ?>
                <option value="<?php echo $key ?>" <?php echo $key == $vacation->month_end ? 'selected' : '' ?>><?php echo $month ?></option>
            <?php endforeach; ?>
        </select>
        <i class="icon-remove vacation-remove" data-id="<?php echo $vacation->id ?>"></i>
    </p>
<?php endforeach; ?>