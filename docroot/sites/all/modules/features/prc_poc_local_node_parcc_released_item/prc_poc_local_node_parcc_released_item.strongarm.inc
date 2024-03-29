<?php
/**
 * @file
 * prc_poc_local_node_parcc_released_item.strongarm.inc
 */

/**
 * Implements hook_strongarm().
 */
function prc_poc_local_node_parcc_released_item_strongarm() {
  $export = array();

  $strongarm = new stdClass();
  $strongarm->disabled = FALSE; /* Edit this to true to make a default strongarm disabled initially */
  $strongarm->api_version = 1;
  $strongarm->name = 'field_bundle_settings_node__parcc_released_item';
  $strongarm->value = array(
    'view_modes' => array(),
    'extra_fields' => array(
      'form' => array(
        'title' => array(
          'weight' => '0',
        ),
        'path' => array(
          'weight' => '1',
        ),
      ),
      'display' => array(),
    ),
  );
  $export['field_bundle_settings_node__parcc_released_item'] = $strongarm;

  $strongarm = new stdClass();
  $strongarm->disabled = FALSE; /* Edit this to true to make a default strongarm disabled initially */
  $strongarm->api_version = 1;
  $strongarm->name = 'menu_options_parcc_released_item';
  $strongarm->value = array(
    0 => 'main-menu',
  );
  $export['menu_options_parcc_released_item'] = $strongarm;

  $strongarm = new stdClass();
  $strongarm->disabled = FALSE; /* Edit this to true to make a default strongarm disabled initially */
  $strongarm->api_version = 1;
  $strongarm->name = 'menu_parent_parcc_released_item';
  $strongarm->value = 'main-menu:0';
  $export['menu_parent_parcc_released_item'] = $strongarm;

  $strongarm = new stdClass();
  $strongarm->disabled = FALSE; /* Edit this to true to make a default strongarm disabled initially */
  $strongarm->api_version = 1;
  $strongarm->name = 'node_options_parcc_released_item';
  $strongarm->value = array(
    0 => 'status',
  );
  $export['node_options_parcc_released_item'] = $strongarm;

  $strongarm = new stdClass();
  $strongarm->disabled = FALSE; /* Edit this to true to make a default strongarm disabled initially */
  $strongarm->api_version = 1;
  $strongarm->name = 'node_preview_parcc_released_item';
  $strongarm->value = '0';
  $export['node_preview_parcc_released_item'] = $strongarm;

  $strongarm = new stdClass();
  $strongarm->disabled = FALSE; /* Edit this to true to make a default strongarm disabled initially */
  $strongarm->api_version = 1;
  $strongarm->name = 'node_submitted_parcc_released_item';
  $strongarm->value = 0;
  $export['node_submitted_parcc_released_item'] = $strongarm;

  return $export;
}
