
Feature: Patient Search functionality

  Background:
    Given user goes to Find Patient Record page

  Scenario Outline: Find an existent patient
    When user search for patient <input_name>
    Then page return records containing patients named <displayed_name>

    Examples:
      | input_name |  displayed_name |
      |     'John' | 'John Campbell' |
      |    'Smith' |    'Paul Smith' |
      |     'Mary' |   'Mary Miller' |

  Scenario: Check that there are no records about specified patient
    When user search for a patient 'Daniele'
    Then page return record containing patients named 'Daniele'
