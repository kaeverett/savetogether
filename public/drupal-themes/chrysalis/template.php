<?php
// $Id: template.php,v 1.2 2008/12/12 19:01:27 recidive Exp $

function chrysalis_breadcrumb($breadcrumb) {
  if (!empty($breadcrumb)) {
    return '<div class="breadcrumb">' . theme('item_list', $breadcrumb, NULL, 'ul', array('class' => 'clear-block')) . '</div>';
  }
}

function chrysalis_preprocess_page(&$vars) {
  $vars['primary_links'] = theme('links', $vars['primary_links']);
  $vars['secondary_links'] = theme('links', $vars['secondary_links'], array('class' => 'links'));
}
