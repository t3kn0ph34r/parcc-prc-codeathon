<?php
/**
 * Created by PhpStorm.
 * User: jfranks
 * Date: 9/29/14
 * Time: 1:14 PM
 */


use Behat\Behat\Context\Step\Then;
use Drupal\DrupalExtension\Event\EntityEvent;

class FeatureContext extends \Drupal\DrupalExtension\Context\DrupalContext {
  protected $timestamp;

  /**
   * Initializes context.
   *
   * Every scenario gets its own context instance.
   * You can also pass arbitrary arguments to the
   * context constructor through behat.yml.
   */
  public function __construct()
  {
    $this->timestamp = time();
  }

  protected function fixStepArgument($argument) {
    if (strpos($argument, '@timestamp') !== FALSE) {
      $argument = str_replace('@timestamp', $this->timestamp, $argument);
    }
    if (strpos($argument, '@uname') !== FALSE) {
      $start = strpos($argument, '@uname');
      $bracket_open = strpos($argument, '[', $start);
      $bracket_close = strpos($argument, ']', $start);
      $uname = substr($argument, $bracket_open + 1, $bracket_close - $bracket_open - 1);
      $user = $this->users[$uname];
      $uid = $user->uid;
      $whole_token = "@uname[$uname]";
      $argument = str_replace($whole_token, $uid, $argument);
    }
    return parent::fixStepArgument($argument);
  }

  /**
   * The default assertRegionHeading() doesn't do a fixStepArgument()
   * on the $heading variable. We need to.
   * @param $heading
   * @param $region
   * @throws Exception
   */
  public function assertRegionHeading($heading, $region) {
    $fixed_heading = $this->fixStepArgument($heading);
    return parent::assertRegionHeading($fixed_heading, $region);
  }


  /**
   * @Then /^"([^"]*)" should be visible$/
   * @param $selector
   * @throws Exception
   */
  public function shouldBeVisible($selector) {
    $el = $this->getSession()->getPage()->find('css', $selector);
    if (empty($el)) {
      throw new Exception("Element ({$selector}) not found");
    } elseif (!$el->isVisible()) {
      throw new Exception("Element ({$selector}) is not visible");
    }
  }

  /**
   * @Then /^"([^"]*)" should not be visible$/
   */
  public function shouldNotBeVisible($selector) {
    $el = $this->getSession()->getPage()->find('css', $selector);
    if (empty($el)) {
      throw new Exception("Element ({$selector}) not found");
    } elseif ($el->isVisible()) {
      throw new Exception("Element ({$selector}) is visible");
    }
  }

  /**
   * Checks for a field with specified id|name|title|alt|value.
   *
   * @Then /^(?:|I )should see an? "(?P<element>[^"]*)" field$/
   */
  public function iShouldSeeAField($field)
  {
    $field = $this->fixStepArgument($field);
    if (!$this->getSession()->getPage()->hasField($field)) {
      throw new Exception("Element ({$field}) not found");
    }
  }

  /**
   * Checks for that a field with specified id|name|title|alt|value does not exist.
   *
   * @Then /^(?:|I )should not see an? "(?P<element>[^"]*)" field$/
   */
  public function iShouldNotSeeAField($field)
  {
    $field = $this->fixStepArgument($field);
    if ($this->getSession()->getPage()->hasField($field)) {
      throw new Exception("Element ({$field}) found");
    }
  }

  /**
   * Checks for a link with specified id|name|title|alt|value.
   *
   * @Then /^(?:|I )should see an? "(?P<element>[^"]*)" link$/
   */
  public function iShouldSeeALink($field)
  {
    $field = $this->fixStepArgument($field);
    if (!$this->getSession()->getPage()->hasLink($field)) {
      throw new Exception("Element ({$field}) not found");
    }
  }

  /**
   * Checks for a button with specified id|name|title|alt|value.
   *
   * @Then /^(?:|I )should see an? "(?P<button>(?:[^"]|\\")*)" button$/
   */
  public function iShouldSeeAButton($button)
  {
    $button = $this->fixStepArgument($button);
    if (!$this->getSession()->getPage()->hasButton($button)) {
      throw new Exception("Element ({$button}) not found");
    }
  }

  /**
   * Asserts that a given node type is not editable.
   *
   * @Then /^I should not be able to edit (?:a|an) "([^"]*)" node$/
   */
  public function assertNotEditNodeOfType($type) {
    $node = (object) array('type' => $type);
    $saved = $this->getDriver()->createNode($node);
    $this->nodes[] = $saved;

    // Set internal browser on the node edit page.
    $this->getSession()->visit($this->locatePath('/node/' . $saved->nid . '/edit'));

    // Test status.
    return new Then("I should get a \"403\" HTTP response");

  }

  /**
   * Asserts that a given user has the specified role.
   *
   * @Then /^the user "([^"]*)" should have a role of "([^"]*)"$/
   */
  public function assertUserHasRole($username, $role) {
    parent::assertDrushCommandWithArgument('user-information', $username);
    parent::assertDrushOutput($role);
  }

  /**
   * Asserts that a given field has the specified length
   *
   * @Then /^the field "([^"]*)" should have a length of "([^"]*)"$/
   */
  public function assertFieldLength($field, $length) {
    $f = field_info_field($field);
    $actual_length = $f['columns']['format']['length'];
    if ($length != $actual_length) {
      throw new \Exception(sprintf("The field '%s' did not have a length of %d.\nInstead, it was:\n\n%d", $field, $length, $actual_length));
    }
  }

  /**
   * Creates multiple users.
   * Overrides parent::createUsers().
   */
  public function createUsers(\Behat\Gherkin\Node\TableNode $usersTable) {
    foreach ($usersTable->getHash() as $userHash) {

      // If we have roles convert it to array.
      if (isset($userHash['roles'])) {
        $userHash['roles'] = explode(',', $userHash['roles']);
        $userHash['roles'] = array_map('trim', $userHash['roles']);
      }

      $user = (object) $userHash;

      // Set a password.
      if (!isset($user->pass)) {
        $user->pass = $this->getDrupal()->random->name();
      }

      $this->dispatcher->dispatch('beforeUserCreate', new EntityEvent($this, $user));
      $this->getDriver()->userCreate($user);
      $this->dispatcher->dispatch('afterUserCreate', new EntityEvent($this, $user));

      // Now we will populate all of the field_ entries in the TableNode
      $account = user_load_by_name($user->name);
      $w = entity_metadata_wrapper('user', $account);

      // We are using email_registration, so we have to tweak the user name to match what it expects
      $email_parts = explode('@', $userHash['mail']);
      $new_user_name = $email_parts[0] . '_' . $account->uid;
      $w->name->set($new_user_name);

      foreach($userHash as $key => $value) {
        if (strpos($key, 'field_') === 0) {
          // This is a field_something so we have to assign it
          $w->{$key}->set($value);
        }
      }
      $w->save();

      $this->users[$user->name] = $user;
    }
  }


  /**
   * Creates X number of random users with the specified role
   *
   * @Given /^I create (\d+) users with the "(?P<role>[^"]*)" role$/
   */
  public function createXUsersOfYRole($number, $role) {
    // Provides user data to createUsers()
    $table_node = new \Behat\Gherkin\Node\TableNode();
    $table_node->addRow(array('name', 'mail', 'status'));

    for ($i = 0; $i < $number; $i++) {
      $user_name = 'userbehat' . $i;
      $email = $user_name . '@example.com';
      $table_node->addRow(array($user_name, $email, 1));
    }
    parent::createUsers($table_node);
  }
  /**
   * Asserts that a given field has no empty cells
   *
   * @Given /^I should not see any empty "(?P<column>[^"]*)" cells$/
   */
  public function assertNoCellsEmpty($column) {
    $page = $this->getSession()->getPage();

    $matches = $page->find("xpath", "//*[contains(text(), 'Roles')]");
    $css_class = str_replace('views-field ', '', $matches->getAttribute('class'));

    $cells = $page->findAll('css', "td.$css_class");

    foreach ($cells as $cell) {
      if (!strlen($cell->getText())) {
        throw new \Exception(sprintf("The column '%s' had an empty cell!", $column));
      }
    }
  }

  /**
   * @Given /^the test email system is enabled$/
   */
  public function theTestEmailSystemIsEnabled() {
    // Store the original system to restore after the scenario.
    $this->originalMailSystem = variable_get('mail_system', array('default-system' => 'DefaultMailSystem'));
    // Set the test system.
    variable_set('mail_system', array('default-system' => 'TestingMailSystem'));
    // Flush the email buffer, allowing us to reuse this step definition to clear existing mail.
    variable_set('drupal_test_email_collector', array());
  }

  /**
   * @Given /^the default email system is enabled$/
   */
  public function theDefaultEmailSystemIsEnabled() {
    // Set the default system.
    variable_set('mail_system', array('default-system' => 'DefaultMailSystem'));
    // Flush the email buffer, allowing us to reuse this step definition to clear existing mail.
    variable_set('drupal_test_email_collector', array());
  }

  /**
   * This looks for a link with text matching the uid for the specified username
   * and clicks that link.
   *
   * @Then /^I click on the edit link for the user "(?P<username>[^"]*)"$/
   */
  public function clickUserViewEditLink($username) {
    $user = $this->users[$username];
    $uid = $user->uid;
    $this->clickLink($uid);
  }

  /**
   * Verifies that the URL is the edit page for the specified username.
   *
   * @Then /^I should be at the edit page for the user "(?P<username>[^"]*)"$/
   */
  public function assertUserEditUrl($username) {
    $user = $this->users[$username];
    $uid = $user->uid;

    $expected_path = "user/$uid/edit";

    $this->assertAtPath($expected_path);
  }

  /**
   * @Then /^I should not see the radio button "(?P<label>[^"]*)"$/
   */
  public function assertRadioByIdNotPresent($label, $id = FALSE) {
    $element = $this->getSession()->getPage();
    $radiobutton = $id ? $element->findById($id) : $element->find('named', array('radio', $this->getSession()->getSelectorsHandler()->xpathLiteral($label)));
    if ($radiobutton !== NULL) {
      throw new \Exception(sprintf('The radio button with "%s" was found on the page %s', $id ? $id : $label, $this->getSession()->getCurrentUrl()));
    }
  }


  /**
   * @Then /^the email to "([^"]*)" should contain "([^"]*)"$/
   */
  public function theEmailToShouldContain($to, $contents) {
    // We can't use variable_get() because $conf is only fetched once per
    // scenario.
    $mail_to = $this->fixStepArgument($to);

    $variables = array_map('unserialize', db_query("SELECT name, value FROM {variable} WHERE name = 'drupal_test_email_collector'")->fetchAllKeyed());
    $this->activeEmail = FALSE;
    foreach ($variables['drupal_test_email_collector'] as $message) {
      if ($message['to'] == $mail_to) {
        $this->activeEmail = $message;
        if (strpos($message['body'], $contents) !== FALSE ||
          strpos($message['subject'], $contents) !== FALSE) {
          return TRUE;
        }
        throw new \Exception('Did not find expected content in message body or subject.');
      }
    }
    throw new \Exception(sprintf('Did not find expected message to %s', $mail_to));
  }

  /**
   * @Given /^the email should contain "([^"]*)"$/
   */
  public function theEmailShouldContain($contents) {
    if (!$this->activeEmail) {
      throw new \Exception('No active email');
    }
    $message = $this->activeEmail;
    if (strpos($message['body'], $contents) !== FALSE ||
      strpos($message['subject'], $contents) !== FALSE) {
      return TRUE;
    }
    throw new \Exception('Did not find expected content in message body or subject.');
  }

  /**
   * @Then /^I follow the link in the email$/
   */
  public function followEmailLink() {
    if (!$this->activeEmail) {
      throw new \Exception('No active email');
    }
    $message = $this->activeEmail;

    $body = $message['body'];
    // The Regular Expression to look for URLs
    $reg_exUrl = '`([^"=\'>])((http|https|ftp)://[^\s<]+[^\s<\.)])`i';
    if(preg_match($reg_exUrl, $body, $url)) {
      // It does return multiple matches. In this particular case we only care about the first one (so far)
      $follow_url = $url[0];
    }
    if (isset($follow_url)) {
      // Have to go to the driver level because visit only works for pages off the base url
      $this->getSession()->visit($follow_url);
      return TRUE;
    }
    throw new \Exception('Did not find expected content in message body or subject.');
  }

  public function afterScenario($event) {
    parent::afterScenario($event);
    $this->theDefaultEmailSystemIsEnabled();
  }


}