// $Id: asynchronous.js,v 1.2 2008/12/12 19:01:27 recidive Exp $

/**
 * Asynchronous selectors.
 */
Drupal.settings.asynchronous.selectors = {
  'primary_links': {selector: '#primary-links', type: 'html'},
  'secondary_links': {selector: '#secondary-links', type: 'html'},
  'content': {selector: '#content', type: 'html'},
  'left': {selector: '#sidebar-left', type: 'html'},
  'right': {selector: '#sidebar-right', type: 'html'},
  'footer': {selector: '#footer', type: 'html'}
};

/**
 * Asynchronous preprocess.
 */
Drupal.settings.asynchronous.preprocess = function(data) {
  // Override data.content adding data that mimics
  // what's on page.tpl.php for the selector for 'content'
  // that's on Asynchronous.settings.selectors above.
  var content = data.breadcrumb || '';
  if (data.mission) {
    content += '<div id="mission">'+ data.mission +'</div>';
  }
  if (data.title) {
    content += '<h1 class="title">'+ data.title +'</h1>';
  }
  if (data.tabs) {
    content += '<div id="tabs">'+ data.tabs +'</div>';
  }
  if (data.help) {
    content += '<div id="help">'+ data.help +'</div>';
  }
  if (data.show_messages && data.messages) {
    content += data.messages;
  }
  content += data.content;
  content += data.feed_icons;
  
  data.content = content;

  data.footer = data.footer_message + data.footer;
};
