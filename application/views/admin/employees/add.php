<div id="alert_div">
     
</div>
<div class="employees_add">
    <form class="user-edit" action="<?php echo $user->id ? URL::site('admin/employees/edit/' . $user->id) : "" ?>" method="POST">
            <?php if ($user->id): ?>
                <input type="hidden" name="user[id]" value="<?php echo $user->id ?>"/>
            <?php endif; ?>
            <table class="table table-bordered table-striped">
                    <tbody>
                            <tr>
                                    <td><label for="username">Username:</label></td>
                                    <td><input type="text" name="user[username]" id="username" value="<?php echo $user->username ?>" <?php echo $user->id ? 'readonly' : '' ?>></td>
                            </tr>
                            <tr>
                                    <td><label for="password">Password:</label></td>
                                    <td><input type="text" name="user[password]" id="password"></td>
                            </tr>
                            <tr>
                                    <td><label for="email">Email:</label></td>
                                    <td><input type="text" name="user[email]" id="email" value="<?php echo $user->email ?>" <?php echo $user->id ? 'readonly' : '' ?>></td>
                            </tr>
                            <tr>
                                    <td><label for="first_name">First Name:</label></td>
                                    <td><input type="text" name="user[first_name]" id="first_name" value="<?php echo $user->first_name ?>"></td>
                            </tr>
                            <tr>
                                    <td><label for="last_name">Last Name:</label></td>
                                    <td><input type="text" name="user[last_name]" id="last_name" value="<?php echo $user->last_name ?>"></td>
                            </tr>
                            <tr>
                                <td><label for="hire_date">Hire Date:</label></td>
                                <td>                          
                                    <div class="input-append date" id="dp3" data-date="<?php echo Helper_Output::siteDate($user->hire_date) ?>" data-date-format="dd-mm-yyyy">
                                        <input name="user[hire_date]" class="span2" size="16" type="text" value="<?php echo Helper_Output::siteDate($user->hire_date) ?>" readonly>
                                        <span class="add-on"><i class="icon-calendar"></i></span>
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                    <td><label for="pr_type">Specialization:</label></td>
                                    <td>
                                            <select name="user[pr_type]" id="prtype">
                                                <option value="1" <?php echo $user->pr_type == 1 ? "selected" : "" ?> >Web</option>
                                                <option value="2" <?php echo $user->pr_type == 2 ? "selected" : "" ?> >Mobile</option>
                                            </select>
                                    </td>
                            </tr>
                            <?php if (!$pm): ?>
                                <tr>
                                        <td><label for="level">Level:</label></td>
                                        <td>
                                                <select name="user[level_id]" id="level">
                                                        <option value="1" <?php echo $user->level_id == 1 ? "selected" : "" ?> >Junior</option>
                                                        <option value="2" <?php echo $user->level_id == 2 ? "selected" : "" ?> >Middle</option>
                                                        <option value="3" <?php echo $user->level_id == 3 ? "selected" : "" ?> >Senior</option>
                                                </select>
                                        </td>
                                </tr>
                                <tr>
                                        <td><label for="devrole">Role:</label></td>
                                        <td>
                                                <input type="text" id="devrole" name="user[devrole]" placeholder="PHP developer, Front-end developer" value="<?php echo $user->devrole ?>" >
                                        </td>
                                </tr>
                            <?php else: ?>
                                <input type="hidden" name="user[level_id]" value="4">
                            <?php endif; ?>
                            <tr>
                                    <td><label for="enlevel">English:</label></td>
                                    <td>
                                            <select name="user[enlevel_id]" id="enlevel">
                                                <?php foreach ($enlevels as $enlevel): ?>
                                                    <option value="<?php echo $enlevel->id ?>" <?php echo $user->enlevel_id == $enlevel->id ? "selected" : "" ?>><?php echo $enlevel->title ?></option>
                                                <?php endforeach; ?>
                                            </select>
                                    </td>
                            </tr>
                            <?php if ($user->id): ?>
                                <?php if (!$pm): ?>
                                <?php if ($user->level_id != 3 ): ?>
                                <tr id="next_exam_co">
                                    <td><label for="next_exam_company">Next exam (company):</label></td>
                                    <td>
                                        <span id="next_exam_company">
                                            <?php if ($next_exam_company > 0): ?>
                                                <span class="label label-important"><?php echo $next_exam_company ?> days to pass</span> 
                                            <?php else: ?>
                                                <span class="label label-success">READY</span>
                                            <?php endif; ?>
                                        </span>
                                        <span class="btn reset com" data-id="<?php echo $user->id ?>" >Reset company test</span>
                                    </td>
                                </tr>
                                <?php endif; ?>
                                <?php endif; ?>
                                <?php if ($user->enlevel_id != 5 ): ?>
                                    <tr id="next_exam_en">
                                        <td><label for="next_exam_english">Next exam (english):</label></td>
                                        <td>
                                            <span id="next_exam_english">
                                                <?php if ($next_exam_english > 0): ?>
                                                    <span class="label label-important"><?php echo $next_exam_english ?> days to pass</span> 
                                                <?php else: ?>
                                                    <span class="label label-success">READY</span>
                                                <?php endif; ?>
                                            </span>
                                            <span class="btn reset en" data-id="<?php echo $user->id ?>" >Reset english test</span>
                                        </td>
                                    </tr>
                                <?php endif; ?>
                            <?php endif; ?>
                            <tr>
                                    <td><label>Brainbench certificate:</label></td>
                                    <td>
                                        <?php foreach ($certificates as $certificate):?>
                                            <div class="brainbench_cert">
                                                    <input type="hidden" name="certificates[id][]" value="<?php echo $certificate->id ?>">
                                                    <input type="text" id="title" name="certificates[title][]" placeholder="Name" value="<?php echo $certificate->title ?>" readonly>
                                                    <input class="input-small" type="text" id="score" name="certificates[score][]" placeholder="Score" value="<?php echo $certificate->score ?>" readonly>
                                                    <span class="btn" onclick="javascript: add.deleteCertificate(<?php echo $certificate->id ?>, this, <?php echo $user->id ?>)">remove</span>
                                            </div>
                                        <?php endforeach; ?>
                                        <div id="add_new" class="btn">Add new brainbench certificate</div>
                                    </td>
                            </tr>
                            <?php if (!$pm): ?>
                                <tr id="next_exams">
                                        <td>Exams for next step:</td>
                                        <td>

    <!--                                            <div class="junior_exams">
                                                    <label><input type="checkbox" id="company_test_junior" name="company_test_junior"> Company test (Junior) passed</label>
                                            </div>-->
                                            <div class="middle_exams" style="display:none;">
                                                <?php foreach ($middle_achievments as $middle_achievment): ?>
                                                    <label><input type="checkbox" <?php echo Helper_User::check_achievments($achievments, $middle_achievment->id) ? "checked" : ""  ?> value ="<?php echo $middle_achievment->id ?>" name="achievments[middle][]"><?php echo $middle_achievment->title ?></label>
                                                <?php endforeach; ?>
                                            </div>
                                            <div class="senior_exams" style="display:none;">
                                                <?php foreach ($senior_achievments as $senior_achievment): ?>
                                                    <label><input type="checkbox" <?php echo Helper_User::check_achievments($achievments, $senior_achievment->id) ? "checked" : ""  ?> value ="<?php echo $senior_achievment->id ?>" name="achievments[senior][]"><?php echo $senior_achievment->title ?></label>
                                                <?php endforeach; ?>
                                            </div>
                                        </td>
                                </tr>
                            <?php endif; ?>
                            <?php if ($user->id): ?>
                                <tr>
                                    <td colspan="2">
                                        <fieldset class="vacation-field">
                                            <legend>Отпуск</legend>
                                            <p class="choose-year">
                                                Выберите год:
                                                <select name="vacation[year]" id="year" class="year-select" data-id="<?php echo $user->id ?>">
                                                        <?php foreach ($years as $year): ?>
                                                            <option value="<?php echo $year['year'] ?>" <?php echo $year['year'] == date('Y') ? 'selected' : '' ?> ><?php echo $year['year'] ?></option>
                                                        <?php endforeach; ?>
                                                </select>
                                                <button class="btn btn-primary year-button" id="vacation-button" type="button">Добавить дату отпуска</button>
                                            </p>
                                            <div class="vacation">
                                                <?php echo View::factory('admin/employees/partials/vacation')->set('vacations', $vacations)->render(); ?>
                                            </div>
                                            <p></p>
                                        </fieldset>
                                    </td>
                                </tr>
                            <?php endif; ?>
                            <tr>
                                    <input id="input-avatar" data-action="none" type="hidden" value="<?php echo $avatar_hidden ?>" name="avatar[avatar]"/>
                                    <input id="crop-avatar" data-action="none" type="hidden" value="" name="avatar[crop_avatar]"/>
                                    <td><label>Photo:</label></td>
                                    <td>
                                            <div class="uploaded_avatar">
                                                    <div class="left">
                                                            <div class="fileselector">
                                                                    <input id="fileupload" type="file" name="file" data-url="<?php echo URL::site('uploader/temp');?>" enctype="multipart/form-data"/>
                                                            </div>
                                                            <figure class="full-avatar">
                                                                    <img src="<?php echo $avatar ?>" alt="">
                                                            </figure>
                                                    </div>
                                            </div>
                                    </td>
                            </tr>
                            <tr>
                                    <td></td>
                                    <td>
                                            <input type="submit" class="btn" value="Save">
                                    </td>
                            </tr>
                    </tbody>
            </table>
    </form>
</div>
<div id="modal_delete">

</div>