<div class="container">
    <div class="page-header">
        <?php Helper_Alert::get_flash(); ?>
        <p class="lead">Forgot your password?</p>
    </div>
    <p>Your password will be reset and a message containing your new password will be sent instantly to your email.</p>
    <p>Enter your email address:</p>
    <form action="" method="POST" id="forgot">
        <input type="text" id="email" name="email" >
        <div><input class="btn btn-primary" type="submit" value="Send" /></div>
    </form>
</div>
