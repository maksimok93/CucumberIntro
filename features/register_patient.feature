
Feature: Register Patient functionality
  Scenario: Register new patient
    Given go to Login page and log in
    And Choose Register page
    And Fill required fields in Name tab
    And Choose gender
    And Fill birthdate field
    And Fill address field
    When User confirm registration
    Then page return register success message
