@api @speaking-listening @prc-1419
Feature: PRC-1419 Speaking and Listening - Add/Edit Resource - Form Validation
  As a PRC Admin, I want to get feedback about any errors that occur when I add or edit a Speaking and Listening resource so that I can fix errors and successfully add or edit a Speaking and Listening resource.

  Scenario: Validate form
    Given I am logged in as a user with the "PRC Admin" role
    And I am on "speaking-listening"
    And I click "Add Resource"
    When I press "Save"
    Then I should see the error message containing "Resource name field is required."
    And I should see the error message containing "File field is required."
    And I should see the error message containing "Resource Type field is required."
    And I should see the error message containing "At least one Subject is required."
    And I should see the error message containing "At least one Standard is required."
    And I should see the error message containing "Grade Level field is required."

  Scenario: Validate file type
    Given I am logged in as a user with the "PRC Admin" role
    And I am on "speaking-listening"
    And I click "Add Resource"
    And I attach the file "testfiles/trt_upload_schools_valid.csv" to "edit-field-file-single-und-0-upload"
    When I press "Save"
    Then I should see the error message containing "The specified file trt_upload_schools_valid.csv could not be uploaded. Only files with the following extensions are allowed: doc docx mp4 pdf xls xlsx."