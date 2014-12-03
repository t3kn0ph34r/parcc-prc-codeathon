@api
Feature: PRC-34 View Available PD Courses
  As an Educator,
  I want to view available PD Courses on the PRC website,
  so that I can select, view, and complete a PD course.

  # AC1 The Professional Development tab shall be available to the top navigation bar for all roles.
  # Tested in PRC-159, PRC-160, PRC-151, PRC-347

  Scenario: AC2 At click, it opens the Professional Development page where each user shall see the courses to which she has permission to see.
    Given "PD Course" nodes:
    | Title       | field_course_objectives | field_permissions | field_length_quantity | field_length_unit |
    | PD Course 1 | Obj1                    | public            | 1                     | week              |
    | PD Course 2 | Obj2                    | public            | 2                     | month             |
    And I am logged in as a user with the "Educator" role
    And I am on the homepage
    When I click "Professional Development"

#  AC3 A user who has permission to no course, shall see the following generic statement:
#  Welcome to PRC Professional Development page. There are no courses available to your account. Please contact your school/district to benefit from PARCC Professional Development courses exported to your district learning management system.
#  AC4 Only the Published courses that the user has permission to shall be displayed. The layout of PD page is similar to Digital Library layout implemented in PRC-32 (specified in the following AC). Variances from Digital Library functionality are in green font.
#  AC5 In this page, the courses are listed based on the sort definition. Default by date: the most recent on the top
#  AC6 The following components are displayed for each course:
#  <Course Title>
#  Course Length (if available), such as:
#  (12-week)
#  Course Objectives: <Course Objective>, such as: (Updated Description to Course Objectives on 11/20/14)
#  Course Objectives:
#  Lorem ipsum dolores
#  Thumbnail (when available) -Can we use the 1st module image as thumbnail?
#  AC7 Social and sharing: The following icons are available and redirect the user to the selected application:
#  Email
#  Share to Facebook
#  Share to Edmodo
#  AC8 A Sort dropdown menu allows the user to change the order. The only available option for now is: Date: most recent on the top