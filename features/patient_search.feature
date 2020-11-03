
Feature: Patient Search functionality

  Background:
    Given user goes to Find Patient Record page

  Scenario Outline: Find an existent patient
    When user search for patient <input_name>
    Then page return records containing <full_name>
    Then page return records containing <age>
    Then page return records containing <birthdate>

    Examples:
      | input_name |     full_name | age |   birthdate |
      |     'John' | John Campbell |  57 | 06 Jan 1963 |
      |    'Smith' |    Paul Smith |  43 | 12 May 1977 |
      |     'Mary' |   Mary Miller |  56 | 08 Sep 1964 |

  Scenario: Check that there are no records about specified patient
    When user search for a patient 'Daniele'
    Then page return record containing patients named 'Daniele'
