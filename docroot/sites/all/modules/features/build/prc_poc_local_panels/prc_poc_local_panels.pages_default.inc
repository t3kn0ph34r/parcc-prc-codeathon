<?php
/**
 * @file
 * prc_poc_local_panels.pages_default.inc
 */

/**
 * Implements hook_default_page_manager_handlers().
 */
function prc_poc_local_panels_default_page_manager_handlers() {
  $export = array();

  $handler = new stdClass();
  $handler->disabled = FALSE; /* Edit this to true to make a default handler disabled initially */
  $handler->api_version = 1;
  $handler->name = 'node_edit_panel_context';
  $handler->task = 'node_edit';
  $handler->subtask = '';
  $handler->handler = 'panel_context';
  $handler->weight = 0;
  $handler->conf = array(
    'title' => 'Document Edit',
    'no_blocks' => 0,
    'pipeline' => 'standard',
    'body_classes_to_remove' => '',
    'body_classes_to_add' => '',
    'css_id' => '',
    'css' => '',
    'contexts' => array(),
    'relationships' => array(),
    'access' => array(
      'plugins' => array(
        0 => array(
          'name' => 'node_type',
          'settings' => array(
            'type' => array(
              'document' => 'document',
            ),
          ),
          'context' => 'argument_node_edit_1',
          'not' => FALSE,
        ),
      ),
      'logic' => 'and',
    ),
    'panels_everywhere_site_template' => 'site_template_panel_context_basic',
  );
  $display = new panels_display();
  $display->layout = 'flexible';
  $display->layout_settings = array();
  $display->panel_settings = array(
    'style_settings' => array(
      'default' => NULL,
      'center' => NULL,
    ),
  );
  $display->cache = array();
  $display->title = '';
  $display->uuid = 'dac59c83-77f2-45fd-9de6-3b74ab6d7024';
  $display->content = array();
  $display->panels = array();
    $pane = new stdClass();
    $pane->pid = 'new-ae0a108a-7a09-4036-865a-97d284d394dd';
    $pane->panel = 'center';
    $pane->type = 'entity_form_field';
    $pane->subtype = 'node:field_document';
    $pane->shown = TRUE;
    $pane->access = array();
    $pane->configuration = array(
      'label' => '',
      'formatter' => '',
      'context' => 'argument_node_edit_1',
      'override_title' => 0,
      'override_title_text' => '',
    );
    $pane->cache = array();
    $pane->style = array(
      'settings' => NULL,
    );
    $pane->css = array();
    $pane->extras = array();
    $pane->position = 0;
    $pane->locks = array();
    $pane->uuid = 'ae0a108a-7a09-4036-865a-97d284d394dd';
    $display->content['new-ae0a108a-7a09-4036-865a-97d284d394dd'] = $pane;
    $display->panels['center'][0] = 'new-ae0a108a-7a09-4036-865a-97d284d394dd';
    $pane = new stdClass();
    $pane->pid = 'new-32cda07f-d20f-4477-a2e5-1d31662407a2';
    $pane->panel = 'center';
    $pane->type = 'form';
    $pane->subtype = 'form';
    $pane->shown = TRUE;
    $pane->access = array();
    $pane->configuration = array(
      'context' => 'argument_node_edit_1',
      'override_title' => 0,
      'override_title_text' => '',
    );
    $pane->cache = array();
    $pane->style = array(
      'settings' => NULL,
    );
    $pane->css = array();
    $pane->extras = array();
    $pane->position = 1;
    $pane->locks = array();
    $pane->uuid = '32cda07f-d20f-4477-a2e5-1d31662407a2';
    $display->content['new-32cda07f-d20f-4477-a2e5-1d31662407a2'] = $pane;
    $display->panels['center'][1] = 'new-32cda07f-d20f-4477-a2e5-1d31662407a2';
  $display->hide_title = PANELS_TITLE_FIXED;
  $display->title_pane = 'new-ae0a108a-7a09-4036-865a-97d284d394dd';
  $handler->conf['display'] = $display;
  $export['node_edit_panel_context'] = $handler;

  $handler = new stdClass();
  $handler->disabled = FALSE; /* Edit this to true to make a default handler disabled initially */
  $handler->api_version = 1;
  $handler->name = 'site_template_panel_context_basic';
  $handler->task = 'site_template';
  $handler->subtask = '';
  $handler->handler = 'panel_context';
  $handler->weight = 0;
  $handler->conf = array(
    'title' => 'Sample variant',
    'no_blocks' => 1,
    'css_id' => 'page-wrapper',
    'css' => '/* set a fixed overall width */
  #page-wrapper > .panel-flexible-inside {
    width: 1020px;
    margin-left: auto;
    margin-right: auto;
  }

  /* Add some margin to the main content row. This class was set in the layout designer. */
  #page-wrapper .main-content {
    padding: 0 10px;
  }',
    'contexts' => array(),
    'relationships' => array(),
    'access' => array(
      'plugins' => array(),
      'logic' => 'and',
    ),
    'pipeline' => 'standard',
  );
  $display = new panels_display();
  $display->layout = 'threecol_33_34_33_stacked';
  $display->layout_settings = array(
    'items' => array(
      'canvas' => array(
        'type' => 'row',
        'contains' => 'column',
        'children' => array(
          0 => 'main',
        ),
        'parent' => NULL,
        'class' => '',
        'column_class' => '',
        'row_class' => '',
        'region_class' => '',
        'no_scale' => FALSE,
        'fixed_width' => '',
        'column_separation' => '0.5em',
        'region_separation' => '0.5em',
        'row_separation' => '0.5em',
      ),
      'main' => array(
        'type' => 'column',
        'width' => 100,
        'width_type' => '%',
        'children' => array(
          0 => 1,
          1 => 'main-row',
        ),
        'parent' => 'canvas',
      ),
      'main-row' => array(
        'type' => 'row',
        'contains' => 'region',
        'children' => array(
          0 => 'content',
          1 => 'sidebar',
        ),
        'parent' => 'main',
        'class' => 'main-content',
      ),
      'content' => array(
        'type' => 'region',
        'title' => 'Content',
        'width' => '100',
        'width_type' => '%',
        'parent' => 'main-row',
        'class' => '',
      ),
      'sidebar' => array(
        'type' => 'region',
        'title' => 'Sidebar',
        'width' => '200',
        'width_type' => 'px',
        'parent' => 'main-row',
      ),
      1 => array(
        'type' => 'row',
        'contains' => 'region',
        'children' => array(
          0 => 'header',
        ),
        'parent' => 'main',
        'class' => 'header',
      ),
      'header' => array(
        'type' => 'region',
        'title' => 'Header',
        'width' => 100,
        'width_type' => '%',
        'parent' => '1',
      ),
    ),
  );
  $display->panel_settings = array(
    'style_settings' => array(
      'default' => NULL,
      'content' => NULL,
      'sidebar' => NULL,
      'header' => NULL,
      'top' => NULL,
      'left_above' => NULL,
      'right_above' => NULL,
      'middle' => NULL,
      'left_below' => NULL,
      'right_below' => NULL,
      'bottom' => NULL,
      'left' => NULL,
      'right' => NULL,
    ),
  );
  $display->cache = array();
  $display->title = '';
  $display->uuid = '6cf16171-9eed-4715-a06d-bbf810171713';
  $display->content = array();
  $display->panels = array();
    $pane = new stdClass();
    $pane->pid = 'new-79b51686-b758-44d6-960b-22c34502903f';
    $pane->panel = 'bottom';
    $pane->type = 'block';
    $pane->subtype = 'system-navigation';
    $pane->shown = FALSE;
    $pane->access = array();
    $pane->configuration = array(
      'override_title' => 0,
      'override_title_text' => '',
    );
    $pane->cache = array();
    $pane->style = array(
      'settings' => NULL,
    );
    $pane->css = array();
    $pane->extras = array();
    $pane->position = 0;
    $pane->locks = '';
    $pane->uuid = '79b51686-b758-44d6-960b-22c34502903f';
    $display->content['new-79b51686-b758-44d6-960b-22c34502903f'] = $pane;
    $display->panels['bottom'][0] = 'new-79b51686-b758-44d6-960b-22c34502903f';
    $pane = new stdClass();
    $pane->pid = 'new-cb4d4f5c-ca4a-46be-85e6-8a23aa0923e1';
    $pane->panel = 'left';
    $pane->type = 'block';
    $pane->subtype = 'user-login';
    $pane->shown = TRUE;
    $pane->access = array();
    $pane->configuration = array(
      'override_title' => 0,
      'override_title_text' => '',
    );
    $pane->cache = array();
    $pane->style = array(
      'settings' => NULL,
    );
    $pane->css = array();
    $pane->extras = array();
    $pane->position = 0;
    $pane->locks = '';
    $pane->uuid = 'cb4d4f5c-ca4a-46be-85e6-8a23aa0923e1';
    $display->content['new-cb4d4f5c-ca4a-46be-85e6-8a23aa0923e1'] = $pane;
    $display->panels['left'][0] = 'new-cb4d4f5c-ca4a-46be-85e6-8a23aa0923e1';
    $pane = new stdClass();
    $pane->pid = 'new-4f21f20b-838f-40a8-8f4c-a311b665e83b';
    $pane->panel = 'left';
    $pane->type = 'pane_navigation';
    $pane->subtype = 'pane_navigation';
    $pane->shown = TRUE;
    $pane->access = array();
    $pane->configuration = array();
    $pane->cache = array();
    $pane->style = array(
      'settings' => NULL,
    );
    $pane->css = array();
    $pane->extras = array();
    $pane->position = 1;
    $pane->locks = '';
    $pane->uuid = '4f21f20b-838f-40a8-8f4c-a311b665e83b';
    $display->content['new-4f21f20b-838f-40a8-8f4c-a311b665e83b'] = $pane;
    $display->panels['left'][1] = 'new-4f21f20b-838f-40a8-8f4c-a311b665e83b';
    $pane = new stdClass();
    $pane->pid = 'new-291c8563-c33a-4eb9-890b-c456895f451c';
    $pane->panel = 'left';
    $pane->type = 'block';
    $pane->subtype = 'system-navigation';
    $pane->shown = TRUE;
    $pane->access = array();
    $pane->configuration = array(
      'override_title' => 0,
      'override_title_text' => '',
    );
    $pane->cache = array();
    $pane->style = array(
      'settings' => NULL,
    );
    $pane->css = array();
    $pane->extras = array();
    $pane->position = 2;
    $pane->locks = array();
    $pane->uuid = '291c8563-c33a-4eb9-890b-c456895f451c';
    $display->content['new-291c8563-c33a-4eb9-890b-c456895f451c'] = $pane;
    $display->panels['left'][2] = 'new-291c8563-c33a-4eb9-890b-c456895f451c';
    $pane = new stdClass();
    $pane->pid = 'new-1e4b019d-1d0c-4eb6-82b3-603f28cc85bb';
    $pane->panel = 'middle';
    $pane->type = 'page_content';
    $pane->subtype = 'page_content';
    $pane->shown = TRUE;
    $pane->access = array();
    $pane->configuration = array(
      'context' => 'argument_page_content_1',
      'override_title' => 1,
      'override_title_text' => '',
    );
    $pane->cache = array();
    $pane->style = array(
      'settings' => NULL,
    );
    $pane->css = array();
    $pane->extras = array();
    $pane->position = 0;
    $pane->locks = '';
    $pane->uuid = '1e4b019d-1d0c-4eb6-82b3-603f28cc85bb';
    $display->content['new-1e4b019d-1d0c-4eb6-82b3-603f28cc85bb'] = $pane;
    $display->panels['middle'][0] = 'new-1e4b019d-1d0c-4eb6-82b3-603f28cc85bb';
    $pane = new stdClass();
    $pane->pid = 'new-eac7ffe9-2df1-4efa-958c-7b1175f1c2fa';
    $pane->panel = 'right';
    $pane->type = 'views';
    $pane->subtype = 'flag_bookmarks_tab';
    $pane->shown = TRUE;
    $pane->access = array();
    $pane->configuration = array(
      'override_pager_settings' => 0,
      'use_pager' => 0,
      'nodes_per_page' => '0',
      'pager_id' => '0',
      'offset' => '0',
      'more_link' => 0,
      'feed_icons' => 0,
      'panel_args' => 0,
      'link_to_view' => 1,
      'args' => '',
      'url' => '',
      'display' => 'default',
      'context' => array(
        0 => 'logged-in-user.uid',
      ),
      'override_title' => 0,
      'override_title_text' => '',
    );
    $pane->cache = array();
    $pane->style = array(
      'settings' => NULL,
    );
    $pane->css = array();
    $pane->extras = array();
    $pane->position = 0;
    $pane->locks = array();
    $pane->uuid = 'eac7ffe9-2df1-4efa-958c-7b1175f1c2fa';
    $display->content['new-eac7ffe9-2df1-4efa-958c-7b1175f1c2fa'] = $pane;
    $display->panels['right'][0] = 'new-eac7ffe9-2df1-4efa-958c-7b1175f1c2fa';
    $pane = new stdClass();
    $pane->pid = 'new-8772b732-d3cc-4190-ade2-ee6697e8c099';
    $pane->panel = 'top';
    $pane->type = 'pane_messages';
    $pane->subtype = 'pane_messages';
    $pane->shown = TRUE;
    $pane->access = array();
    $pane->configuration = array();
    $pane->cache = array();
    $pane->style = array(
      'settings' => NULL,
    );
    $pane->css = array();
    $pane->extras = array();
    $pane->position = 0;
    $pane->locks = '';
    $pane->uuid = '8772b732-d3cc-4190-ade2-ee6697e8c099';
    $display->content['new-8772b732-d3cc-4190-ade2-ee6697e8c099'] = $pane;
    $display->panels['top'][0] = 'new-8772b732-d3cc-4190-ade2-ee6697e8c099';
    $pane = new stdClass();
    $pane->pid = 'new-fe234387-76b2-408c-b3ce-9139f1139fc9';
    $pane->panel = 'top';
    $pane->type = 'pane_header';
    $pane->subtype = 'pane_header';
    $pane->shown = TRUE;
    $pane->access = array();
    $pane->configuration = array();
    $pane->cache = array();
    $pane->style = array(
      'settings' => NULL,
    );
    $pane->css = array();
    $pane->extras = array();
    $pane->position = 1;
    $pane->locks = '';
    $pane->uuid = 'fe234387-76b2-408c-b3ce-9139f1139fc9';
    $display->content['new-fe234387-76b2-408c-b3ce-9139f1139fc9'] = $pane;
    $display->panels['top'][1] = 'new-fe234387-76b2-408c-b3ce-9139f1139fc9';
  $display->hide_title = PANELS_TITLE_PANE;
  $display->title_pane = 'new-1e4b019d-1d0c-4eb6-82b3-603f28cc85bb';
  $handler->conf['display'] = $display;
  $export['site_template_panel_context_basic'] = $handler;

  return $export;
}

/**
 * Implements hook_default_page_manager_pages().
 */
function prc_poc_local_panels_default_page_manager_pages() {
  $page = new stdClass();
  $page->disabled = FALSE; /* Edit this to true to make a default page disabled initially */
  $page->api_version = 1;
  $page->name = 'home_page';
  $page->task = 'page';
  $page->admin_title = 'Home Page';
  $page->admin_description = 'Home Page';
  $page->path = 'front';
  $page->access = array();
  $page->menu = array(
    'type' => 'none',
    'title' => '',
    'weight' => '0',
    'name' => 'navigation',
    'parent' => array(
      'type' => 'none',
      'title' => '',
      'weight' => 0,
      'name' => 'navigation',
    ),
  );
  $page->arguments = array();
  $page->conf = array();
  $page->default_handlers = array();
  $handler = new stdClass();
  $handler->disabled = FALSE; /* Edit this to true to make a default handler disabled initially */
  $handler->api_version = 1;
  $handler->name = 'page_home_page_panel_context';
  $handler->task = 'page';
  $handler->subtask = 'home_page';
  $handler->handler = 'panel_context';
  $handler->weight = 0;
  $handler->conf = array(
    'title' => 'Landing page',
    'no_blocks' => FALSE,
    'pipeline' => 'ipe',
    'body_classes_to_remove' => '',
    'body_classes_to_add' => '',
    'css_id' => '',
    'css' => '',
    'contexts' => array(),
    'relationships' => array(),
  );
  $display = new panels_display();
  $display->layout = 'threecol_25_50_25_stacked';
  $display->layout_settings = array();
  $display->panel_settings = array(
    'style_settings' => array(
      'default' => NULL,
      'top' => NULL,
      'left' => NULL,
      'middle' => NULL,
      'right' => NULL,
      'bottom' => NULL,
    ),
  );
  $display->cache = array();
  $display->title = 'No Title';
  $display->uuid = '7ddd0fc5-7ade-4b16-b936-828e5483547f';
  $display->content = array();
  $display->panels = array();
    $pane = new stdClass();
    $pane->pid = 'new-845ca9ca-6bfc-4022-b6f6-2468614d3ebf';
    $pane->panel = 'left';
    $pane->type = 'panels_mini';
    $pane->subtype = 'digital_library_placeholder';
    $pane->shown = TRUE;
    $pane->access = array();
    $pane->configuration = array(
      'override_title' => 0,
      'override_title_text' => '',
    );
    $pane->cache = array();
    $pane->style = array(
      'settings' => NULL,
    );
    $pane->css = array();
    $pane->extras = array();
    $pane->position = 0;
    $pane->locks = array();
    $pane->uuid = '845ca9ca-6bfc-4022-b6f6-2468614d3ebf';
    $display->content['new-845ca9ca-6bfc-4022-b6f6-2468614d3ebf'] = $pane;
    $display->panels['left'][0] = 'new-845ca9ca-6bfc-4022-b6f6-2468614d3ebf';
    $pane = new stdClass();
    $pane->pid = 'new-3d1f3aec-75cc-4127-a8ac-a4042d5fba3c';
    $pane->panel = 'middle';
    $pane->type = 'panels_mini';
    $pane->subtype = 'welcome_anonymous';
    $pane->shown = TRUE;
    $pane->access = array();
    $pane->configuration = array(
      'override_title' => 0,
      'override_title_text' => '',
    );
    $pane->cache = array();
    $pane->style = array(
      'settings' => NULL,
    );
    $pane->css = array();
    $pane->extras = array();
    $pane->position = 0;
    $pane->locks = array();
    $pane->uuid = '3d1f3aec-75cc-4127-a8ac-a4042d5fba3c';
    $display->content['new-3d1f3aec-75cc-4127-a8ac-a4042d5fba3c'] = $pane;
    $display->panels['middle'][0] = 'new-3d1f3aec-75cc-4127-a8ac-a4042d5fba3c';
    $pane = new stdClass();
    $pane->pid = 'new-90507084-c070-42e6-bd8a-6903054c7b6a';
    $pane->panel = 'middle';
    $pane->type = 'panels_mini';
    $pane->subtype = 'slideshow_placeholder';
    $pane->shown = TRUE;
    $pane->access = array();
    $pane->configuration = array(
      'override_title' => 0,
      'override_title_text' => '',
    );
    $pane->cache = array();
    $pane->style = array(
      'settings' => NULL,
    );
    $pane->css = array();
    $pane->extras = array();
    $pane->position = 1;
    $pane->locks = array();
    $pane->uuid = '90507084-c070-42e6-bd8a-6903054c7b6a';
    $display->content['new-90507084-c070-42e6-bd8a-6903054c7b6a'] = $pane;
    $display->panels['middle'][1] = 'new-90507084-c070-42e6-bd8a-6903054c7b6a';
    $pane = new stdClass();
    $pane->pid = 'new-a38223fb-bd9e-4ab5-8e4e-38b154d803de';
    $pane->panel = 'right';
    $pane->type = 'block';
    $pane->subtype = 'user-login';
    $pane->shown = TRUE;
    $pane->access = array();
    $pane->configuration = array(
      'override_title' => 0,
      'override_title_text' => '',
    );
    $pane->cache = array();
    $pane->style = array(
      'settings' => NULL,
    );
    $pane->css = array();
    $pane->extras = array();
    $pane->position = 0;
    $pane->locks = array();
    $pane->uuid = 'a38223fb-bd9e-4ab5-8e4e-38b154d803de';
    $display->content['new-a38223fb-bd9e-4ab5-8e4e-38b154d803de'] = $pane;
    $display->panels['right'][0] = 'new-a38223fb-bd9e-4ab5-8e4e-38b154d803de';
    $pane = new stdClass();
    $pane->pid = 'new-2dcda7cb-6604-4301-a7f1-e263104c4691';
    $pane->panel = 'right';
    $pane->type = 'views_panes';
    $pane->subtype = 'sample_article-panel_pane_1';
    $pane->shown = TRUE;
    $pane->access = array();
    $pane->configuration = array();
    $pane->cache = array();
    $pane->style = array(
      'settings' => NULL,
    );
    $pane->css = array();
    $pane->extras = array();
    $pane->position = 1;
    $pane->locks = array();
    $pane->uuid = '2dcda7cb-6604-4301-a7f1-e263104c4691';
    $display->content['new-2dcda7cb-6604-4301-a7f1-e263104c4691'] = $pane;
    $display->panels['right'][1] = 'new-2dcda7cb-6604-4301-a7f1-e263104c4691';
  $display->hide_title = PANELS_TITLE_NONE;
  $display->title_pane = 'new-a38223fb-bd9e-4ab5-8e4e-38b154d803de';
  $handler->conf['display'] = $display;
  $page->default_handlers[$handler->name] = $handler;
  $pages['home_page'] = $page;

  return $pages;

}