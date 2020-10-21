
Feature: User authentication functionality
  Scenario: User with valid credentials can login
    Given user open main page
    When user logs in with valid username and password
    Then user logged in successfully
