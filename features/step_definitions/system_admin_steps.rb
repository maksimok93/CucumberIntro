
Given(/^user goes to System Administration page$/) do
  log_in_as_admin
  @browser.element(xpath: SysAdminLocators::SYSTEM_ADMINISTRATION).click
end

And(/^user opens Manage Scheduler page$/) do
  @browser.element(xpath: SysAdminLocators::MANAGE_SCHEDULER).click
end

And(/^user click Add Tasks button$/) do
  @browser.element(xpath: SysAdminLocators::ADD_NEW_TASK).click
end

And(/^Fill Name field$/) do
  @browser.text_field(placeholder: 'Enter task name').set 'Alert Reminder Task'
end

And(/^user chooses Schedulable Class option$/) do
  @browser.select_list(css: SysAdminLocators::SCHEDULABLE_CLASS).click
  @browser.option(text: 'org.openmrs.scheduler.tasks.AlertReminderTask').click
end

And(/^Fill Description field$/) do
  @browser.textarea(class: /^((?!description).)*$/).set 'Alert Reminder Task'
end

And(/^Fill Start time field$/) do
  @browser.text_field(css: SysAdminLocators::START_TIME).set '2020-10-26 13:10:27.0000'
end

And(/^user chooses Repeat interval options$/) do
  @browser.text_field(placeholder: 'Enter repeat interval').set '1'
  @browser.select_list(css: SysAdminLocators::REPEAT_INTERVAL_TIME).click
  @browser.option(text: 'Days').click
end

When(/^user saves a task in Manage Scheduler$/) do
  @browser.element(css: SysAdminLocators::SAVE).click
end

Then(/^page return saved task success message$/) do
  wait_visible_text('Task definition saved successfully.')
  expect(@browser.text.include?('Task definition saved successfully.')).to be true
end
