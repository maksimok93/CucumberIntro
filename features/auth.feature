
Feature: User authentication functionality
  Scenario: User with valid credentials can login
    Given user opens main page
    When user enters valid username and password
    Then user entered successfully
