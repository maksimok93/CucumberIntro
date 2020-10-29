

Feature: Data management functionality
  Background:
    Given user goes to Data management page
    * user opens Merge Patient Electronic Records page

  Scenario: User merges records with correct different ids
    * user enters 1st Patient ID
    * user enters 2nd Patient ID
    * click continue button
    * user chooses the first patient to merge
    When user confirms merging
    Then patients page return Records merged success message

  Scenario: User merges records with correct same ids
    When user enters same ids for both patients
    Then continue button is disabled

  Scenario: User merges records with incorrect ids
    When user enters incorrect ids for both patients
    Then displays message patient not found
