@api @d7
Feature: Create User Account Following an Invite (PRC-73)
  As a potential PRC Administrator,
  I want to create a new user account for myself after having received the create user account invitation from my fellow PRC Administrators,
  so that I can access the system with designated role/permissions.

  Background:
    Given I am logged in as a user with the "PRC Admin" role
    And I visit "invite/add/invite_by_email"
    And the test email system is enabled
    Then I select the radio button "Educator"
    And I fill in "Message" with "4321MESSAGE1234"
    And I fill in "E-mail" with "example1@timestamp@example.com,example2@timestamp@example.com"
    And I press "Send Invitation"
    Then the email to "example1@timestamp@example.com" should contain "has sent you an invite!"
    And the email should contain "has invited you to join Partnership Resource Center at"
    And the email should contain "4321MESSAGE1234"
    And I click "Log out"
    Then I follow link "1" in the email

  Scenario: AC5 - A Create New Account button is provided at the end. At click, the system shall:
    Then I should see the heading "Create User Account to Join Partnership Resource Center" in the "content" region
    And the url should match "user/register"
    And I should see "example1@timestamp@example.com" in the "E-mail" field
    And I fill in "Password" with "abc123"
    And I fill in "Confirm password" with "abc123"
    And I fill in "First Name *" with "First"
    And I fill in "Last Name *" with "Last"
    And I press "Create new account"
    Then I should see the message containing "You have accepted the invitation from"
    And I should see the message containing "Registration successful. You are now logged in."
    #  Creates a new account with the pre-defined role
    Then the user "example1@timestamp@example.com" should have a role of "Educator"
    Then I delete the user with the email address "example1@timestamp@example.com"