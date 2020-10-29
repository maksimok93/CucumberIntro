
Feature: Register Patient functionality

  Rule:
    During the patient registration only required fields are filled in.

  Background:
    Given go to Login page and log in
    * Choose Register page
    * Fill required fields in Name tab

  Scenario: Register new patient
    * Choose gender
    * Choose male
    * Fill birthdate field
    * Fill address field
    When User confirm registration
    Then page return register success message

  Scenario: Register patient which already exists
    And Choose gender
    Then page return similar patient found message
