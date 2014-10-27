@api @d7
Feature: Admin UI: Post Content (PRC-28)
  As a Content Author,
  I want to post a new content to PRC Website,
  so that the educators can access and view them.

  Scenario: Content Author permission - Edit Any
    Given I am logged in as a user with the "Content Author" role
    Then I should not be able to edit another user's "Digital Library Content" node

  Scenario: Content Author permission - Edit Own
    Given I am logged in as a user with the "Content Author" role
    Then I should be able to edit my own "Digital Library Content" node

  Scenario: AC1 Content author permission to create
    Given I am logged in as a user with the "Content Author" role
    And I am viewing my "Digital Library Content" node with the title "PRC-28 AC1 Title"

  Scenario Outline: AC2 and AC3 Content tab visibility for authorized users
    Given I am logged in as a user with the "<role>" role
    And I am on the homepage
    Then I should see the link "Content" in the "header" region

    Examples:
    | role            |
    |  Content Author |
    |  PRC Admin      |
    |  administrator  |

  Scenario: AC2 and AC3 Content tab invisibility for Educators
    Given I am logged in as a user with the "Educator" role
    And I am on the homepage
    Then I should not see the link "Content" in the "header" region

  Scenario: AC2 and AC3 Content tab invisibility for anonymous
    Given I am an anonymous user
    And I am on the homepage
    Then I should not see the link "Content" in the "header" region

  Scenario: AC4-6 Content Authors click on Content tab link
    Given I am logged in as a user with the "Content Author" role
    And I am on the homepage
    When I follow "Content"
    Then the url should match "admin-content"
    Then I click "Add content"
    Then the url should match "node/add/digital-library-content"
    And I should see the heading "Create Digital Library Content" in the "content" region

  Scenario: AC7 - The following fields are to be displayed on
    Given I am logged in as a user with the "Content Author" role
    And I am on "node/add/digital-library-content"
    Then I should see a "Title *" field
    And I should see a "Author Name" field
    And I should see a "Tags" field
    And I should see a "Summary" field
    And I should see an "Body" field
    And I should see "Attach a File"
    And I should see "Add a Thumbnail Image"
    And I should see "Link to URL"
    And I should see "Add More Information (Content Properties)"

  Scenario: AC8-11 Users can upload and save an attachment
    Given I am logged in as a user with the "Content Author" role
    And I am on "node/add/digital-library-content"
    And I should see "Attach a File"
    And I press the "Upload" button
