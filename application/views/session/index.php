<?php Helper_Alert::get_flash() ?>
<div class="login">
        <form action="" method="POST">
                <div><input type="text" name="username" id="username" placeholder="Login"></div>
                <div><input type="password" name="password" id="password" placeholder="Password"></div>
                <div><input class="btn" type="submit"></div>
                <a href="<?php echo URL::site('session/forgot') ?>">Forgot password?</a>
        </form>
</div>