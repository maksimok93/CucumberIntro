
Given(/^user goes to Find Patient Record page$/) do
  log_in_as_admin
  @browser.element(xpath: InpatientWardLocators::FIND_PATIENT_RECORD).click
end

When('user search for patient {string}') do |string|
  @browser.text_field(id: 'patient-search').set string
  sleep 3
end

When(/^user search for a patient 'Daniele'$/) do
  @browser.text_field(id: 'patient-search').set 'Daniele'
end

Then(/^page return records containing (.*)$/) do |result|
  expect(@browser.text.include?(result)).to be true
end

Then(/^page return record containing patients named 'Daniele'$/) do
  expect(@browser.text.include?('Daniele')).to be true
end
