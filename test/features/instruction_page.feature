@api @instruction @prc-1400
Feature: PRC-1400 Instruction Page - Create Landing Page
  As a user,
  I want to be able to navigate to the Instruction landing page
  so that I can get to where I want to go more efficiently.

  Scenario: 1 Default
    Given I am on the homepage
    When I click "Instruction"
    Then the url should match "instruction"
    And I should see the link "Formative Instructional Tasks"
    And I should see the link "Speaking and Listening"
    And the "Formative Instructional Tasks" link should point to "formative-instructional-tasks"
    And the "Speaking and Listening" link should point to "speaking-listening"