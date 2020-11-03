
Given(/^user goes to Data management page$/) do
  log_in_as_admin
  @browser.element(css: DataManagementLocators::DATA_MANAGEMENT).click
end

And(/^user opens Merge Patient Electronic Records page$/) do
  @browser.element(css: DataManagementLocators::MERGE_PATIENT).click
end

And(/^user enters 1st Patient ID$/) do
  set_patients_id('1001MH')
end

And(/^user enters 2nd Patient ID$/) do
  set_patients_id('1005HM', 2)
end

And(/^user enters same ids for both patients$/) do
  set_patients_id('1002C4')
  set_patients_id('1002C4', 2)
end

And(/^user enters incorrect ids for both patients$/) do
  set_patients_id('1111')
  set_patients_id(2, '9999')
end

And(/^click continue button$/) do
  # Search for patient to make the Continue button active
  @browser.text_field(id: 'patient-search').set 'Edward'
  sleep 2
  @browser.element(class: 'confirm').click
end

And(/^user chooses the first patient to merge$/) do
  @browser.element(id: 'first-patient').click
end

When(/^user confirms merging$/) do
  @browser.element(id: 'confirm-button').click
end

Then(/^patients page return Records merged success message$/) do
  wait_visible_text('Records merged! Viewing preferred patient.')
  expect(@browser.text.include?('Records merged! Viewing preferred patient.')).to be true
end

Then(/^displays message patient not found$/) do
  wait_visible_text('Patient not found')
  expect(@browser.text.include?('Patient not found')).to be true
end

Then(/^continue button is disabled$/) do
  expect(@browser.element(css: DataManagementLocators::CONTINUE_DISABLED).present?).to be true
end
