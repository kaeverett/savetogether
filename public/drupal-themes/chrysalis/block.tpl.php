<div class="<?php print "block block-$block->module"; ?>" id="<?php print "block-$block->module-$block->delta"; ?>">
  <?php if (!empty($block->subject)): ?>
  <h2 class="title"><?php print $block->subject; ?></h2>
  <?php endif; ?>
  <div class="content"><?php print $block->content; ?></div>
</div>
