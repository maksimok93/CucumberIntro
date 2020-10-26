
Feature: System Administration functionality
  Scenario: User creates a new task in Manage Scheduler
    Given user goes to System Administration page
    * user opens Manage Scheduler page
    * user click Add Tasks button
    * Fill Name field
    * user chooses Schedulable Class option
    * Fill Description field
    * Fill Start time field
    * user chooses Repeat interval options
    When user saves a task in Manage Scheduler
    Then page return saved task success message
