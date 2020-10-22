
Feature: Patient Search functionality

  Background:
    Given user goes to Find Patient Record page

  Scenario Outline: Find an existent patient
    When user search for patient <input_name>
    Then page return records containing patients named <displayed_name>

    Examples:
      | input_name | displayed_name |
      |     'John' |         'John' |
      |    'Smith' |        'Smith' |
      |     'Mary' |         'Mary' |

  Scenario: Find a nonexistent patient
    When user search for a nonexistent patient 'Daniele'
    Then page return record containing patients named 'Daniele'
