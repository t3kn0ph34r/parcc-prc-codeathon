@api @course @assessment
Feature: PRC-476 Take Course Exam
  As an educator,
  I want to take a course exam when accessing a PD course,
  so that I can evaluate my learning from modules preceding the exam.

  AC12 Clicking the Go Back button shall redirect the user back to:
  The Professional Development page if this is the last object of the course.
  The Take Course page if there are other objects after this exam.

  Scenario: Last object
    Given I am logged in as a user with the "administrator" role
    Given "PD Module" nodes:
      | title       | field_course_objectives | status | uid | field_length | language |
      | PD Module 1 | Obj1                    | 1      | 1   | 4 day        | und      |
    And I visit "node/add/quiz"
    And I fill in "Title" with "PRC-476 A Exam"
    And I select "PD Exam" from "Quiz Type"
    And I press "Save Draft"
    And I click "Quiz"
    Then I click "Manage questions"
    Then I click "Exam directions"
    And I fill in "edit-body-und-0-value" with "PRC-490 Directions 1 And these are the Body Body Directions Directions"
    And I fill in "Title" with "PRC-527 Directions 1"
    And I fill in "Item Order" with "D1"
    And I press "Save"
    # Add the first question
    Then I click "Multiple choice question"
    And I fill in "edit-body-und-0-value" with "PRC-527 Multi Multi Question Question<p>Paragraph</p>"
    And I fill in "Item Order" with "Q2"
    And I fill in "Title" with "PRC-527 Multi"
    And I fill in "edit-alternatives-0-answer-value" with "Answer Wrong"
    And I fill in "edit-alternatives-1-answer-value" with "Answer Correct"
    And I check the box "edit-alternatives-1-correct"
    And I press "Save"
    # Add the second question
    Then I click "Multiple choice question"
    And I fill in "edit-body-und-0-value" with "PRC-527 Multi Multi Question Question<p>Paragraph</p>"
    And I fill in "Item Order" with "Q3"
    And I fill in "Title" with "PRC-527 Two"
    And I fill in "edit-alternatives-0-answer-value" with "Answer Wrong"
    And I fill in "edit-alternatives-1-answer-value" with "Answer Correct"
    And I check the box "edit-alternatives-1-correct"
    And I press "Save"

    # TODO: Turn attaching modules to a course into step definitions
    And I am on "admin-course"
    When I click "Add course"
    Then I should see the heading "Create Course" in the "content" region
    And I fill in "Course Title *" with "PRC-476 A Course Go Back @timestamp"
    And I fill in "Course Objectives *" with "Take a Course"
    And I select the radio button "Public"
    And I check the box "Published"
    And I press "Save"

    And I follow "Course outline"
    Then I select "Module" from "edit-more-object-type"
    And I press "Add object"
    And I click "Edit Settings"
    And I select "PD Module 1" from "Existing node"
    And I check the box "Use existing content's title"
    And I press "Update"
    Then I should see the text "PD Module 1"

    Then I select "Exam" from "edit-more-object-type"
    And I press "Add object"

    And I follow "Edit Settings" number "1"
    And I select "PRC-476 A Exam" from "Existing node"
    And I press "Update"
    And I should see the text "PRC-476 A Exam"

    Then I press "Save outline"
    Then I should see the message containing "Updated course."
    Given I am logged in as a user with the "Educator" role
    And I am on the homepage
    Then I click "Professional Development"
    Then I click "PRC-476 A Course Go Back @timestamp"
    Then I click "Take course"
    And I should see the message containing "Your enrollment in this course has been recorded."
    And I should not see the link "PRC-476 A Exam"
    But I should see the text "PRC-476 A Exam"
    And I click "PD Module 1"
    Then I click "Professional Development"
    Then I click "PRC-476 A Course Go Back @timestamp"
    And I should see the text "Complete"
    And I should not see the text "Not started"
    And I should see the link "PRC-476 A Exam"
    And "PD Module 1" should precede "PRC-476 A Exam" for the query "a"
    Then I click "PRC-476 A Exam"
    Then I press "Next"
    Then I check radio button number "1"
    Then I press "Next"
    Then I check radio button number "1"
    Then I press "Finish"
    Then I should see the text "Score: 100."
    And I should see the text "Congratulations! You successfully passed the PRC-476 A Exam exam."
    And I click "Go Back"
    And I should be on "professional-development"

  Scenario: Not the last object
    Given I am logged in as a user with the "administrator" role
    Given "PD Module" nodes:
      | title       | field_course_objectives | status | uid | field_length | language |
      | PD Module 1 | Obj1                    | 1      | 1   | 4 day        | und      |
    And I visit "node/add/quiz"
    And I fill in "Title" with "PRC-476 B Exam"
    And I select "PD Exam" from "Quiz Type"
    And I press "Save Draft"
    And I click "Quiz"
    Then I click "Manage questions"
    Then I click "Exam directions"
    And I fill in "edit-body-und-0-value" with "PRC-490 Directions 1 And these are the Body Body Directions Directions"
    And I fill in "Title" with "PRC-527 Directions 1"
    And I fill in "Item Order" with "D1"
    And I press "Save"
    # Add the first question
    Then I click "Multiple choice question"
    And I fill in "edit-body-und-0-value" with "PRC-527 Multi Multi Question Question<p>Paragraph</p>"
    And I fill in "Item Order" with "Q2"
    And I fill in "Title" with "PRC-527 Multi"
    And I fill in "edit-alternatives-0-answer-value" with "Answer Wrong"
    And I fill in "edit-alternatives-1-answer-value" with "Answer Correct"
    And I check the box "edit-alternatives-1-correct"
    And I press "Save"
    # Add the second question
    Then I click "Multiple choice question"
    And I fill in "edit-body-und-0-value" with "PRC-527 Multi Multi Question Question<p>Paragraph</p>"
    And I fill in "Item Order" with "Q3"
    And I fill in "Title" with "PRC-527 Two"
    And I fill in "edit-alternatives-0-answer-value" with "Answer Wrong"
    And I fill in "edit-alternatives-1-answer-value" with "Answer Correct"
    And I check the box "edit-alternatives-1-correct"
    And I press "Save"

    # TODO: Turn attaching modules to a course into step definitions
    And I am on "admin-course"
    When I click "Add course"
    Then I should see the heading "Create Course" in the "content" region
    And I fill in "Course Title *" with "PRC-476 B Course Go Back @timestamp"
    And I fill in "Course Objectives *" with "Take a Course"
    And I select the radio button "Public"
    And I check the box "Published"
    And I press "Save"

    And I follow "Course outline"
    Then I select "Exam" from "edit-more-object-type"
    And I press "Add object"

    And I follow "Edit Settings" number "0"
    And I select "PRC-476 B Exam" from "Existing node"
    And I press "Update"
    And I should see the text "PRC-476 B Exam"

    Then I select "Module" from "edit-more-object-type"
    And I press "Add object"
    And I follow "Edit Settings" number "1"
    And I select "PD Module 1" from "Existing node"
    And I check the box "Use existing content's title"
    And I press "Update"

    Then I press "Save outline"
    Then I should see the message containing "Updated course."

    Given I am logged in as a user with the "Educator" role
    And I am on the homepage
    Then I click "Professional Development"
    Then I click "PRC-476 B Course Go Back @timestamp"
    Then I click "Take course"
    And I should see the message containing "Your enrollment in this course has been recorded."
    And I should see the link "PRC-476 B Exam"
    And "PD Module 1" should precede "PRC-476 B Exam" for the query "a"
    Then I click "PRC-476 B Exam"
    Then I press "Next"
    Then I check radio button number "1"
    Then I press "Next"
    Then I check radio button number "1"
    Then I press "Finish"
    Then I should see the text "Score: 100."
    And I should see the text "Congratulations! You successfully passed the PRC-476 B Exam exam."
    And I click "Go Back"
    And I should see the text "PRC-476 B Course Go Back @timestamp"
    And I should see the link "PD Module 1"
