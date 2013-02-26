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
        <?php if (Helper_Display::instance()->displayHeader()): ?>
            <?php echo View::factory('layouts/partials/header')->render(); ?>
        <?php endif; ?>
        <section class="main">
            <section class="sidebar">
                <ul class="nav nav-list">
                    <li><a href="<?php echo URL::site('session/logout') ?>">Logout</a></li>
                    <li><a href="<?php echo URL::base() ?> ">Go to main page</a></li>
                </ul>
                <?php Helper_MainMenuHelper::render();?>
            </section>
            <section class="content">
                <?php Helper_Alert::get_flash(); ?>
                <?php echo $content ?>
            </section>
        </section>
        <?php if (Helper_Display::instance()->displayFooter()): ?>  	
            <?php echo View::factory('layouts/partials/footer')->render(); ?>
        <?php endif; ?>
    <?php else: ?>
         <?php echo $content ?>
    <?php endif; ?>
	<?php echo Helper_Output::renderJs(); ?>
</body>
</html>