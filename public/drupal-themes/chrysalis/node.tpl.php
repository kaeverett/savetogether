<div class="node node-<?php print $node->type; ?><?php if ($sticky): ?> sticky<?php endif; ?><?php if (!$status): ?> node-unpublished<?php endif; ?>">
  <?php print $picture; ?>
  <?php if (!$page): ?>
    <h2 class="title"><a href="<?php print $node_url; ?>"><?php print $title; ?></a></h2>
  <?php endif; ?>
    <div class="submitted"><?php print $submitted; ?></div>
    <div class="terms"><?php print $terms; ?></div>
    <div class="content"><?php print $content; ?></div>
  <?php if ($links): ?>
    <div class="links"><?php print $links; ?></div>
  <?php endif; ?>
</div>
