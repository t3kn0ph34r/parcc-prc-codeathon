@api @assessment
Feature: PRC-528 Delete Item in Test Customization for Anonymous Users
  As an anonymous user,
  I can't delete items from a test.

  Acceptance Criteria
  In the _Assessment Details page where items are displayed (implemented in PRC-490), in addition to the edit functionality, removing an item from the assessment shall be also available. Note that a user cannot modify the original PARCC Released Tests. They can however create a duplicate where their changes are stored as a new user-created test.
  AC1 Provide a link or button to each of the displayed items for the user to remove an item from the assessment. At click, the system shall remove that item from the list of items displayed (not saved yet).
  AC2 The Save Draft functionality is the same as described in PRC-525, AC copied below:
  If the original test is a PARCC Released Test: The system prompts the user to provide a new test name, labeled as New Quiz Title --Required, String(255)
  If the original test is a user-created test, the system prompts the user to define whether to create a new test, or to override the existing one. For the former, the system prompts the user to provide a new test name, labeled as New Quiz Title --Required, String(255)
  AC3 For the New Quiz Title textbox, populate the original test name concatenated with -copy (example below)
  Algebra Grade 8 - copy
  AC4 Once above information is provided, the system stores the changes associated to that user as the new or existing user-created quiz.
  AC5 If a user navigates away from the page without saving the changes, the system prompts the user to confirm.
  AC6 Permissions: All the above features are available to all roles, except for anonymous users (separated anonymous users into PRC-526)
  AC7 A user cannot save draft of a test with no item. At least, one item should remain in the quiz before it is saved.

  Scenario: Delete an item in a PRC Assessment, copy
    Given I am logged in as a user with the "PRC Admin" role
    And "Subject" terms:
      | name  |
      | subj1 |
      | subj2 |
    And "Assessment" nodes:
      | title          | field_subject | field_quiz_type                    | author      |
      | PRC-528 Delete | subj1, subj2  | PARCC-Released Practice Assessment | @currentuid |
    And I am on "assessments/practice-assessments"
    Then I click "PRC-528 Delete"
    Then I click "Non-interactive Item (text only)"
    And I fill in "edit-body-und-0-value" with "PRC-528 Directions 1 And these are the Body Body Directions Directions"
    And I fill in "Title" with "PRC-528 Directions 1"
    And I press "Save"
    Then I click "Interactive Choice"
    And I fill in "edit-body-und-0-value" with "PRC-528 Multi Multi Question Question"
    And I fill in "Title" with "PRC-528 Multi"
    And I fill in "edit-alternatives-0-answer-value" with "Answer 1"
    And I fill in "edit-alternatives-1-answer-value" with "Answer 2"
    And I check the box "edit-alternatives-1-correct"
    And I press "Save"
    Then I am an anonymous user
    And I visit the last node created
    Then I should see the heading "PRC-528 Delete" in the "sub_header" region
    Then I should see the link "PRC-528 Directions 1"
    Then I check the element with xpath selector "//*[starts-with(@id, 'edit-stayers')]"
    And I press "Save"
    Then I should see the error message containing "You must be logged in to save an assessment."
