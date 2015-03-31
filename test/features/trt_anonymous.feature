@api @trt @structured @school @capacity_check @prc-954 @prc-1051
Feature: PRC-954 Anonymous users cannot see System Check or Testing Capacity links

  Scenario: Anon
    Given I am an anonymous user
    And I click "Technology Readiness"
    Then I should see the heading "Technology Readiness"
    And I should see the text "Overview / instructional copy goes here. Consider explaining importance of testing prior to assessment to increase chances of successful assessment."
    And I should see the text "Important: If you are a school administrator, please run these checks from your school readiness page. Contact your District Administrator to have the link to that page emailed to you."
    And I should see the link "System Check"
    And I should see the text "Description of test and importance of running it: The system check assesses whether a device or similar configuration of devices meets the PARCC minimum requirements."
    And I should see the link "Testing Capacity Check"
    And I should see the text "Description of test and importance of running it: The testing capacity check assesses whether your school has sufficient bandwidth and a sufficient number of devices that meet PARCC minimum requirement in order to run a successful assessment."

  Scenario Outline: Complete a Capacity Check
    Given I am an anonymous user
    And I am on "admin/structure/entity-type/prc_trt/capacity_check/add"
    When I fill in "Number of students" with "<students>"
    When I fill in "Number of devices ready for assessment" with "<devices>"
    When I fill in "Number of days of testing" with "<testing_days>"
    When I fill in "Number of test sessions per day" with "<sessions>"
    When I fill in "Number of sittings per student" with "<sittings>"
    When I fill in "Speed of connection (in Mbps)" with "<connection_speed>"
    When I fill in "Number of access points" with "<access_points>"
    And I select "<connection_type>" from "Network connection"
    And I select "<wired_speed>" from "Wired connection speed"
    And I press "Submit"
    And the ".field-devices-required" element should contain "<devices_required>"
    And the ".field-devices-capacity" element should contain "<devices_capacity>"
    And I should see the text "<bandwidth_capacity> Mbps/student"
    And I should see the heading "Testing Capacity Check Results"
    And I should see the text "# of devices required"
    And I should see the text "devices capacity"
    And I should see the text "Bandwidth Capacity Results"
    And I should see the text "Devices Capacity Results"
    And I should not see the text "<device_not_result>"
    And I should see the text "<device_result>"
    And I should see the text "<device_follow_up>"
    And I should not see the text "<device_not_follow_up>"
    And I should see the text "Number of students:"
    And I should see the text "Number of devices ready for assessment:"
    And I should see the text "Number of sittings per student:"
    And I should see the text "Number of days of testing:"
    And I should see the text "Number of test sessions per day:"
    And I should see the text "Network connection:"
    And I should see the text "Wired connection speed:"
    And I should see the text "Number of access points:"
    And I should see the text "Speed of connection \(in Mbps\):"
    And the ".field-name-field-number-of-students" element should contain "<students>"
    And the ".field-name-field-number-of-devices" element should contain "<devices>"
    And the ".field-name-field-sittings-per-student" element should contain "<sittings>"
    And the ".field-name-field-number-testing-days" element should contain "<testing_days>"
    And the ".field-name-field-number-of-sessions" element should contain "<sessions>"
    And the ".field-name-field-network-connection-type" element should contain "<connection_type>"
    And the ".field-name-field-wired-connection-speed" element should contain "<wired_speed>"
    And the ".field-name-field-number-of-access-points" element should contain "<access_points>"
    And the ".field-name-field-speed-of-connection" element should contain "<connection_speed>"
    And I should see the text "<bandwidth_result>"
    And I should not see the text "<bandwidth_not_result1>"
    And I should not see the text "<bandwidth_not_result2>"
    And I should see the text "<bandwidth_text_result>"
    And I should not see the text "<bandwidth_text_not_result1>"
    And I should not see the text "<bandwidth_text_not_result2>"
    # Updated for PRC-1051
  Examples:
    | students | devices | sittings | testing_days | sessions | connection_type | wired_speed | access_points | connection_speed | devices_required | devices_capacity | bandwidth_capacity | device_result | device_not_result | device_follow_up | device_not_follow_up                | bandwidth_result     | bandwidth_not_result1                       | bandwidth_not_result2 | bandwidth_text_result | bandwidth_text_not_result1                                                                        | bandwidth_text_not_result2                                                                                                  |
    | 100      | 50      | 4        | 10           | 4        | Wired           | 100 Mbps    | 600           | 50               | 11               | 39               | 5                  | Passed        | Failed            |                  | Instructions or next steps go here. | Exceeds Requirements | Meets Minimum Requirements (for no Caching) | Requires Test Caching | Exceeds Requirements  | Provide explanation of what Meets Minimum Requirements (for no Caching) means and any next steps. | Provide explanation of what Requires Test Caching means (will not be able to run successful assessment) and any next steps. |

  Scenario: Run check headless
    Given I am an anonymous user
    And I am on "admin/structure/entity-type/prc_trt/system_check/add"
    And I fill in "System check name" with "Check 2"
    And I fill in "Number of devices" with "23"
    And I select "Desktop" from "Device type"
    And I select "Windows 7" from "Operating system"
    And I fill in "Monitor size (in inches)" with "17"
    And I select "At least 1.5 Ghz and under 2 Ghz" from "Processor speed"
    And I select "At least 2 GB and under 4 GB" from "RAM"
    And I fill in the hidden field "faux_browser" with "ff 33"
    And I fill in the hidden field "faux_javascript" with "true"
    And I fill in the hidden field "faux_cookies" with "true"
    And I fill in the hidden field "faux_images" with "true"
    And I fill in the hidden field "faux_monitor_color_depth" with "16"
    And I fill in the hidden field "faux_screen_resolution_width" with "1024"
    And I fill in the hidden field "faux_screen_resolution_height" with "768"
    And I fill in the hidden field "faux_jre_version" with "1.6.0_65"
    When I press "Submit"
    Then I should see the heading "System Check"
    Then I should see the text "System check name:"
    And I should see the text "Check 2"
    And I should see the text "Number of devices:"
    And I should see the text "23"
    And I should see the text "Device type"
    And I should see the text "Desktop"
    And I should see the text "Operating system"
    And I should see the text "Windows 7"
    And I should see the text "Monitor size \(in inches\)"
    And I should see the text "17"
    And I should see the text "Processor speed"
    And I should see the text "At least 1.5 Ghz and under 2 Ghz"
    And I should see the text "RAM"
    And I should see the text "At least 2 GB and under 4 GB"
    And I should see the text "Browser"
    And I should see the text "ff"
    And I should see the text "33"
    And I should see the text "24"
    And I should see the text "1024"
    And I should see the text "768"
    And I should not see the text "Fail"
    And I should see the text "Passed"
    And I should not see the text "Failed"
