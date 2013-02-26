<?php Helper_Alert::get_flash_form() ?>
<div id="alert_div">
     
</div>
<div class="employees">
    <h3>List of Employees</h3>
    <div class="controls">
        <a href="<?php echo URL::site('admin/employees/add') ?>" class="btn addnewemp">Add New Employee</a>
        <a href="<?php echo URL::site('admin/employees/add/project_manager') ?>" class="btn addnewemp">Add New Project Manager</a>
    </div>
    <table class="emp_table table table-bordered table-striped">
            <thead>
                    <tr>
                            <th>ID</th>
                            <th>Name</th>
                            <th>Role</th>
                            <th class="tbl_buttons">Edit</th>
                            <th class="tbl_buttons">Delete</th>
                            <th>Status</th>
                            <th>Admin</th>
                    </tr>
            </thead>
            <tbody>
                <?php foreach ($users as $user): ?>
                <tr id="row<?php echo $user->id ?>" class="<?php echo $user->status ? "employee-enabled" : "info employee-disabled" ?>">
                        <td class="employee-table"><?php echo $user->id ?></td>
                        <td class="employee-table"><?php echo $user->first_name . ' ' . $user->last_name; ?></td>
                        <td class="employee-table"><?php echo $user->level->title . ' ' . $user->devrole; ?></td>
                        <td class="employee-table"><a href="<?php echo URL::site('admin/employees/edit/' . $user->id) ?>" class="icon icon-edit">Edit</a></td>
                        <td class="employee-table"><?php echo ($logget_user->id != $user->id) ? '<div data-name="' . $user->first_name . ' ' . $user->last_name . '" data-id="' . $user->id . '" class="icon icon-remove">Delete</div>' : '' ?></td>
                        <td class="employee-table"><div data-id="<?php echo $user->id ?>" class="status <?php echo $user->status ? "icon icon-hand-down" :  "icon icon-hand-up" ?>"></div></td>
                        <td class="employee-table"><input class="admin" data-id="<?php echo $user->id ?>" type="checkbox" <?php echo ($user->roles->order_by('role_id', 'desc')->find()->name == 'admin') ? 'checked' : '' ?> <?php echo ($logget_user->id == $user->id) ? 'disabled' : '' ?> ></td>
                </tr>
                <?php endforeach; ?>
            </tbody>
    </table>
</div>
<div id="modal_delete">

</div>