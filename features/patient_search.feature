
Feature: Patient Search functionality
  Scenario: Find patient order by names
    Given a user goes to Find Patient Record page
    When a user search for patient 'John'
    Then page should return records for 'John' patient
