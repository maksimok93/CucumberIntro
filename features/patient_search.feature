
Feature: Patient Search functionality
  Scenario: Find patient order by names
    Given user goes to Find Patient Record page
    When user search for patient 'John'
    Then page return records containing patients named 'John'
