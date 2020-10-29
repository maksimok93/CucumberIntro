
Feature: Patient Search functionality

  Background:
    Given user goes to Find Patient Record page

  Scenario Outline: Find an existent patient
    When user search for patient <input_name>
    Then page return records containing patients named <search_result>

    Examples:
      |     input_name |  search_result  |
      |         'John' | 'John Campbell' |
      | 'John Campbell'|   '06 Jan 1963' |
      |        'Smith' |    'Paul Smith' |
      |  'Paul Smith'  |   '12.May.1977' |
      |         'Mary' |   'Mary Miller' |
      | 'Mary Miller'  |   '08 Sep 1964' |

  Scenario: Check that there are no records about specified patient
    When user search for a patient 'Daniele'
    Then page return record containing patients named 'Daniele'
