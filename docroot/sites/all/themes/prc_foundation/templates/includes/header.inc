<header role="banner" id="header">

  <div class="contain-to-grid">
    <nav class="top-bar">
      <ul class="title-area">
        <li class="name">
          <?php if ($logo): ?>
            <a href="<?php print $front_page; ?>" title="<?php print t('Home'); ?>" rel="home" id="logo">
              <img src="<?php print $logo; ?>" alt="<?php print t('Home'); ?>" />
            </a>
          <?php endif; ?>
        </li>
        <li class="toggle-topbar menu-icon"><a href="#"><span></span></a></li>
      </ul>

      <?php if ($main_menu): ?>
        <section id="main-menu-section" class="top-bar-section">
          <?php print theme('links__system_main_menu', array('links' => $main_menu, 'attributes' => array('id' => 'main-menu', 'class' => 'left'))); ?>
        </section>
      <?php endif; ?>

      <div id="header-icons">
        <a href="#" data-dropdown="search-dropdown" id="search-icon" class="button dropdown round show-for-medium-up left"></a>
        <ul id="search-dropdown" class="f-dropdown" data-dropdown-content>
          <li><?php print render($page['header']); ?></li>
        </ul>
        <a href="#" data-dropdown="profile-dropdown" id="profile-icon" class="button small dropdown round show-for-medium-up left"></a>
        <?php print theme('links__system_secondary_menu', array('links' => $secondary_menu, 'attributes' => array('id' => 'profile-dropdown', 'class' => 'f-dropdown', 'data-dropdown-content' => ''))); ?>
        <?php if ($secondary_menu): ?>
          <section id="secondary-menu-section" class="top-bar-section show-for-small">
            <?php print theme('links__system_secondary_menu', array('links' => $secondary_menu, 'attributes' => array('id' => 'secondary-menu', 'class' => 'right'))); ?>
          </section>
        <?php endif; ?>
        <div class="show-for-small">
          <?php print render($page['header']); ?>
        </div>
      </div>

    </nav> <!-- /.top-bar -->
  </div> <!-- /.contain-to-grid -->

  </header> <!-- /#header -->