<p class="choose-year">
    Выберите год:
    <select name="year" id="year" class="year-select">
            <?php foreach ($years as $year): ?>
                <option value="<?php echo $year['year'] ?>" <?php echo $year['year'] == date('Y') ? 'selected' : '' ?> ><?php echo $year['year'] ?></option>
            <?php endforeach; ?>
    </select>
</p>
<div class="vacation_block">
    <?php echo View::factory('admin/vacation/partials/calendar')->set('users', $users)->set('year', date('Y'))->render(); ?>
</div>