<div class="all-notices">
        <h3>Notices:</h3>
        <?php Helper_Notice::get_notices(false); ?>
        <?php Helper_User::get_passing(Auth::instance()->get_user(), false); ?>
</div>