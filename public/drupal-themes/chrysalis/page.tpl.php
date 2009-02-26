<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="<?php print $language->language; ?>" lang="<?php print $language->language; ?>" dir="<?php print $language->dir; ?>">
<head>
 <title><?php print $head_title; ?></title>
 <?php print $head; ?>
 <?php print $styles; ?>
 <?php print $scripts; ?>
</head>
<body class="body-<?php print $layout; ?>">
<div id="container">

<div id="header" class="clear-block">
  <?php if ($logo): ?>
    <a id="logo" href="<?php print $base_path; ?>" title="<?php print t('Home'); ?>"><img src="<?php print $logo; ?>" alt="<?php print t('Home'); ?>" /></a>
  <?php endif; ?>

  <?php if ($site_name): ?>
    <h1 id='site-name'><a href="<?php print $base_path; ?>" title="<?php print t('Home') ?>"><?php print $site_name; ?></a></h1>
  <?php endif;?>

  <?php if ($site_slogan): ?>
    <div id='site-slogan'><?php print $site_slogan; ?></div>
  <?php endif;?>

  <div id="primary-links">
    <?php print $primary_links; ?>
  </div>

  <div id="secondary-links">
    <?php print $secondary_links; ?>
  </div>
</div>

<div id="wrapper" class="clear-block">
  <?php if ($left): ?>
    <div id="sidebar-left" class="sidebar">
      <?php print $left; ?>
    </div>
  <?php endif; ?>

  <div id="content">
    <?php print $breadcrumb; ?>

    <?php if ($mission): ?>
      <div id="mission"><?php print $mission; ?></div>
    <?php endif; ?>

    <?php if ($title): ?>
      <h1 class="title"><?php print $title; ?></h1>
    <?php endif; ?>

    <?php if ($tabs): ?>
      <div id="tabs"><?php print $tabs; ?></div>
    <?php endif; ?>

    <?php if ($help): ?>
      <div id="help"><?php print $help; ?></div>
    <?php endif; ?>

    <?php if ($messages): ?>
      <?php print $messages; ?>
    <?php endif; ?>

    <!-- start main content -->
    <?php print $content; ?>
    <?php print $feed_icons; ?>
    <!-- end main content -->
  </div>

  <?php if ($right): ?>
    <div id="sidebar-right" class="sidebar">
      <?php print $right; ?>
    </div>
  <?php endif; ?>
</div>

<div id="footer">
  <?php print $footer_message; ?>
  <?php print $footer; ?>
</div>

<?php print $closure; ?>

</div>
</body>
</html>
