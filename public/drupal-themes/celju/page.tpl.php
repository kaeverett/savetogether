<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN"
  "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="<?php print $language->language ?>" lang="<?php print $language->language ?>">
  <head>

    <title><?php print $head_title ?></title>
    <?php print $head ?>
    <?php print $styles ?>
    <?php print $scripts ?>

  </head>
  <body>

    <!-- begin container -->
    <div id="container">

      <!-- begin header -->
      <div id="header">
        <div class="wrapper">

          <?php if ($site_name) { ?><h1 class='siteName'><a href="<?php print $base_path ?>" title="<?php print t('Home') ?>"><?php print $site_name ?></a></h1><?php } ?>
          <?php if ($site_slogan) { ?><h2 class='siteSlogan'><?php print $site_slogan ?></h2><?php } ?>

        </div><!-- end header wrapper -->

        <!-- begin navbar -->
        <div id="navbar">
          <div class="wrapper">

            <?php if (isset($primary_links)) : ?>
              <?php print theme('links', $primary_links, array('class' =>'links', 'id' => 'navtabs')) ?>
            <?php endif; ?>

          </div><!-- end navbar wrapper -->
        </div><!-- end navbar -->


      </div><!-- end header -->

        <!-- begin mainContent -->
        <div id="mainContent">
          <div class="wrapper">

            <!-- begin contentLeft -->
            <div class="contentLeft">
              <?php if ($mission): print '<div class="mission">'. $mission .'</div>'; endif; ?>
              <?php if ($breadcrumb): print '<div class="breadcrumb">'. $breadcrumb . '</div>'; endif; ?>
              <?php if ($title) : print '<h1 class="pageTitle">' . $title . '</h1>'; endif; ?>
              <?php if ($tabs) : print '<div class="tabs">' . $tabs . '</div>'; endif; ?>
              <?php if ($help) : print '<div class="help">' . $help . '</div>'; endif; ?>
              <?php if ($messages) : print '<div class="messages">' .$messages . '</div>'; endif; ?>
              <?php print $content_top; ?>
              <?php print $content; ?>
              <?php print $content_bottom; ?>
              <?php print $feed_icons; ?>
            </div><!-- end contentLeft -->

              <!-- begin sidebar -->
              <?php if ($sidebar) : ?>
                <div class="sidebar">
                  <?php print $sidebar; ?>
                </div>
              <?php endif; ?>
              <!-- end sidebar -->

            <div class="clear"></div>

          </div><!--end mainContent wrapper-->
        </div><!-- end mainContent -->

        <!-- begin footer -->
        <div id="footer">
          <div class="wrapper">

            <!-- footer columns -->


            <!-- begin columnLeft -->
            <?php if ($footerColumnLeft) : ?>
              <div class="columnLeft">
                <?php print $footerColumnLeft; ?>
              </div><!-- end columnRight -->
            <?php endif; ?>

            <!-- begin footerContentLeft -->
            <?php if ($footerContentLeft) : ?>
              <div class="footerContentLeft">
                <?php print $footerContentLeft; ?>
              </div>
            <?php endif; ?>

            <!-- begin columnRight -->
            <?php if ($footerColumnMiddle) : ?>
              <div class="columnMiddle">
                <?php print $footerColumnMiddle; ?>
              </div><!-- end columnRight -->
            <?php endif; ?>


            <!-- begin columnRight -->
            <?php if ($footerColumnRight) : ?>
              <div class="columnRight">
                <?php print $footerColumnRight; ?>
              </div><!-- end columnRight -->
            <?php endif; ?>

            <!-- begin footerContentRight -->
            <?php if($footerContentRight) : ?>
              <div class="footerContentRight">
                <?php print $footerContentRight; ?>
              </div>
            <?php endif; ?>

           </div><!-- end footer wrapper -->
          <div class="clear"></div>


        </div><!-- end footer -->
        <div class="footerMessage">
          <?php print $footer_message; ?>
        </div>

      </div><!-- end contentWrapper -->
    <?php print $closure ?>
  </body>
</html>
