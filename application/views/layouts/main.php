<!DOCTYPE HTML>
<html lang="en-US">
<head>
	<title><?php echo $title ?></title>
	<meta charset="UTF-8">
	<script type="text/javascript">
		var SYS = {
			baseUrl : '<?php echo URL::base() ?>'
		}
	</script>
       
	<?php echo Helper_Output::renderCss(); ?>
</head>
<body>
    <div class="spinner_block" id="spinner"></div>
    <?php if (Helper_Display::instance()->displayAll()): ?>
        <?php echo View::factory('layouts/partials/header')->render(); ?>
        <section class="main">
            <section class="sidebar">
                <div class="myinfo">
                    <div class="username">
                        <p class="name"><?php echo Auth::instance()->get_user()->first_name . " " . Auth::instance()->get_user()->last_name ?></p>
                        <p class="role"><?php echo Auth::instance()->get_user()->level->title . " " . Auth::instance()->get_user()->devrole ?></p>
                    </div>
                    <img src="<?php echo Helper_User::get_avatar_url(Auth::instance()->get_user(), 'medium_'); ?>" alt="">
                    <?php if (Auth::instance()->get_user()->level_id < 3): ?>
                        <div class="totake">
                            <p>Хочешь стать <strong><?php echo Helper_User::get_high_level() ?> developer</strong>? <br>Для этого тебе нужно выполнить следующее:</p>
                            <ul>
                                <?php Helper_User::get_purposes() ?>
                            </ul>
                        </div>
                    <?php endif; ?>
                </div>
                <?php if (Auth::instance()->get_user()->roles->order_by('role_id', 'desc')->find()->name == 'admin'): ?>
                    <ul class="nav nav-list">
                        <li><a href="<?php echo URL::site('admin/dashboard') ?>">Go to admin panel</a></li>
                    </ul>
                <?php endif; ?>
                <?php Helper_MainMenuHelper::render();?>
                <ul class="nav nav-list">
                    <li><a href="<?php echo URL::site('session/logout') ?>">Logout</a></li>
                </ul>
            </section>
            <section class="content">
                <?php if (Helper_Display::instance()->displayNotices()): ?>
                    <?php Helper_Notice::get_notices(); ?>
                    <?php Helper_User::get_passing(Auth::instance()->get_user()); ?>
                <?php endif; ?>
                <?php Helper_Alert::get_flash(); ?>
                <?php echo $content ?>
            </section>
        </section>
        <?php echo View::factory('layouts/partials/footer')->render(); ?>
    <?php else: ?>
         <?php echo $content ?>
    <?php endif; ?>
	<?php echo Helper_Output::renderJs(); ?>
</body>
</html>