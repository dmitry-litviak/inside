<div class="settings">
    <h3>Company Tests</h3>
    <form action="" method="POST" id="settings">
            <table class="table table-bordered table-striped">
                    <tbody>
                        <?php foreach ($levels as $level): ?>
                            <tr>
                                    <td><label for="<?php echo $level->title ?>_time"><?php echo $level->title ?>:</label></td>
                                    <td><input type="text" name="time[]" value="<?php echo $level->days ?>" ></td>
                            </tr>
                        <?php endforeach; ?>
                    </tbody>
            </table>
    <h3>English Tests</h3>
            <table class="table table-bordered table-striped">
                    <tbody>
                        <?php foreach ($enlevels as $enlevel): ?>
                            <tr>
                                    <td><label for="<?php echo $enlevel->title ?>_time"><?php echo $enlevel->title ?>:</label></td>
                                    <td><input type="text" name="en_time[]" value="<?php echo $enlevel->days ?>" ></td>
                            </tr>
                        <?php endforeach; ?>
                    </tbody>
            </table>
    <h3>Mailer</h3>
            <table class="table table-bordered table-striped">
                    <tbody>                            
                            <tr>
                                    <td>Emails</td>
                                    <td>
                                            <input name="emails" value="<?php echo $emails ?>" id="emails" >
                                    </td>
                            </tr>
                            <tr>
                                    <td></td>
                                    <td>
                                            <input type="submit" class="btn">
                                    </td>
                            </tr>
                    </tbody>
            </table>
    </form>
</div>