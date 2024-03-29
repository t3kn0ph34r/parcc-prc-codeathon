@api @trt @state @prc-707 @prc-1223
Feature: PRC-707 State Readiness
  As a State Admin,
  I want to view my State Readiness page,
  so that I can access the results of readiness checks run by schools in my district.

#  Scenario 2: At least one District Created
#  Export all system checks data to .csv [link]
#  Export all testing capacity checks data to .csv [link to the right of link to export system checks data]
#  <District Name> for each district display in alphabetical order under District subhead
#  Export all system checks data to .csv [link]
#  Export all testing capacity checks data to .csv [link to the right of link to export system checks data]
#  Note: [Lynn & Jack, adding note here, per what I understood from Jack. Let me know if there is a better treatment for this.]
#    When the district name is added (PRC-840), the district name appears on the associated State Readiness page
#    When the district name is edited (PRC-841), the updated name appears on the associated State Readiness page

  Scenario Outline: 1 - No Districts Created
    Given I am logged in as a user with the "State Admin" role
    And users:
      | name        | mail        | pass   | field_first_name | field_last_name | status | roles                 |
      | <user_name> | <user_name> | xyz123 | Joe              | Educator        | 1      | Educator, State Admin |
    And "User States" terms:
      | name         |
      | <user_state> |
    And "Member State" terms:
      | name           | field_state_code |
      | <member_state> | SOIL1            |
    And "State" nodes:
      | title          | field_user_state | field_member_state | uid | field_contact_email |
      | <member_state> | <user_state>     | <member_state>     | 1   | <user_name>         |
    And "District" nodes:
      | title           | uid         |
      | <district_name> | @currentuid |
    And I am an anonymous user
    And I am logged in as "<user_name>"
    And I visit "assessments/technology-readiness"
    Then I click "<member_state>"
    Then I should see the heading "<member_state> Readiness"
    And I should see the text "Click the links on this page to access and download district and school data and readiness reports."
    And I should see the text "For more information on the technology requirements used to evaluate platforms and networks please download the"
    And I should see the link "PARCC minimum technology requirements"
    And I should see the text "No districts in your state have been created"
    And I should see the heading "Districts"
  Examples:
    | user_state     | member_state | user_name                          |
    | South Virginia | Old York     | joe_prc_707a@timestamp@example.com |

  Scenario Outline: 2 - At least one District Created
    Given I am logged in as a user with the "State Admin" role
    And users:
      | name        | mail        | pass   | field_first_name | field_last_name | status | roles                 |
      | <user_name> | <user_name> | xyz123 | Joe              | Educator        | 1      | Educator, State Admin |
    And "User States" terms:
      | name         |
      | <user_state> |
    And "Member State" terms:
      | name           | field_state_code |
      | <member_state> | SOIL1            |
    And "State" nodes:
      | title          | field_user_state | field_member_state | uid | field_contact_email |
      | <member_state> | <user_state>     | <member_state>     | 1   | <user_name>         |
      | Another State  | <user_state>     | <member_state>     | 1   | <user_name>         |
    And "District" nodes:
      | title           | uid         | field_ref_trt_state  |
      | <district_name> | @currentuid | @nid[<member_state>] |
      | Other           | @currentuid | @nid[Another State]  |
    And I am an anonymous user
    And I am logged in as "<user_name>"
    And I visit "assessments/technology-readiness"
    Then I click "<member_state>"
    Then I should see the heading "<member_state> Readiness"
    And I should see the text "Click the links on this page to access and download district and school data and readiness reports."
    And I should see the text "For more information on the technology requirements used to evaluate platforms and networks please download the"
    And I should see the link "PARCC minimum technology requirements"
    But I should not see the text "No districts in your state have been created"
    And I should see the heading "Districts"
    And I should see the link "<district_name>"
    And I should see the link "Export all system checks data to .csv"
    And I should see the link "Export all testing capacity checks data to .csv"
  Examples:
    | user_state     | member_state | user_name                          | district_name         |
    | South Virginia | Old York     | joe_prc_707a@timestamp@example.com | PRC-707 S1 @timestamp |

  Scenario Outline: PRC-1223 Districts not in alpha order
    Given users:
      | name             | mail             | pass   | field_first_name | field_last_name | status | roles                 |
      | <district_admin> | <district_admin> | xyz123 | Joe              | Educator        | 1      | Educator, State Admin |
      | <state_admin>    | <state_admin>    | xyz123 | Joe              | Educator        | 1      | Educator, State Admin |
    And I am logged in as "<district_admin>"
    And "User States" terms:
      | name         |
      | <user_state> |
    And "Member State" terms:
      | name           | field_state_code |
      | <member_state> | SOIL1            |
    And "State" nodes:
      | title          | field_user_state | field_member_state | uid | field_contact_email |
      | <member_state> | <user_state>     | <member_state>     | 1   | <state_admin>    |
    And "District" nodes:
      | title   | uid         | field_ref_trt_state  |
      | Alpha   | @currentuid | @nid[<member_state>] |
      | Charlie | @currentuid | @nid[<member_state>] |
      | Delta   | @currentuid | @nid[<member_state>] |
      | Bravo   | @currentuid | @nid[<member_state>] |
      | Echo    | @currentuid | @nid[<member_state>] |
    And I am an anonymous user
    And I am logged in as "<state_admin>"
    And I visit "assessments/technology-readiness"
    Then I click "<member_state>"
    Then I should see the link "Alpha"
    And I should see the link "Echo"
    And "Alpha Readiness" should precede "Bravo Readiness" for the query "a"
    And "Bravo Readiness" should precede "Charlie Readiness" for the query "a"
    And "Charlie Readiness" should precede "Delta Readiness" for the query "a"
    And "Delta Readiness" should precede "Echo Readiness" for the query "a"
    And I should not see the text "Summary of what user can do here: add schools, request school admins to run checks, view readiness by schools in district."
  Examples:
    | user_state     | member_state | district_admin                     | state_admin                 |
    | South Virginia | Old York     | joe_prc_707a@timestamp@example.com | state@timestamp@example.com |