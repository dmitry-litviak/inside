<div class="admin_notices">
        <h3>Add new notice</h3>
        <div class="add_new_notice">
                <form id="notice_form" method="post">
                        <div class="select_wrap">
                                <select name="type" id="type">
                                        <option value="success">success</option>
                                        <option value="error">error</option>
                                        <option value="info">info</option>
                                        <option value="alert">alert</option>
                                </select>
                        </div>
                        <textarea name="text" id="text_notice" cols="1" rows="5" required></textarea>
                        <input type="submit" class="btn">
                </form>
        </div>
        <h3>Active notices</h3>
        <div class="active_notices">
            <?php foreach ($active_notices as $notice): ?>
                <section class="our_notice" id="<?php echo $notice->id ?>">
                        <div class="alert alert-<?php echo $notice->type ?>">
<!--                                <button type="button" class="close" data-dismiss="alert">×</button>-->
                                <strong><?php echo Helper_Notice::getStatusTitle($notice->type) ?></strong> <?php echo $notice->text ?>
                        </div>
                        <div class="btn btn-mini remove" onclick="javascript: index.destroyer(this)">remove this notice</div>
                        <div class="btn btn-mini deactivate" onclick="javascript: index.activator(this)">make non-active</div>
                </section>
            <?php endforeach; ?>
        </div>
        <h3>Non-Active notices</h3>
        <div class="nonactive_notices">
                <?php foreach ($non_active_notices as $notice): ?>
                    <section class="our_notice nonactive_notice" id="<?php echo $notice->id ?>">
                            <div class="alert alert-<?php echo $notice->type ?>">
<!--                                    <button type="button" class="close" data-dismiss="alert">×</button>-->
                                    <strong><?php echo Helper_Notice::getStatusTitle($notice->type) ?></strong> <?php echo $notice->text ?>
                            </div>
                            <div class="btn btn-mini remove" onclick="javascript: index.destroyer(this)">remove this notice</div>
                            <div class="btn btn-mini activate" onclick="javascript: index.activator(this)">make active</div>
                    </section>
                <?php endforeach; ?>
        </div>
</div>