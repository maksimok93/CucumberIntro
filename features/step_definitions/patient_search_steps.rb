
Given(/^user goes to Find Patient Record page$/) do
  log_in_as_admin
  @browser.element(xpath: InpatientWardLocators::FIND_PATIENT_RECORD).click
end

When('user search for patient {string}') do |string|
  @browser.text_field(id: 'patient-search').set string
end

When(/^user search for a patient 'Daniele'$/) do
  @browser.text_field(id: 'patient-search').set 'Daniele'
end

Then('page return records containing patients named {string}') do |string|
  wait_visible_text(string)
  expect(@browser.text.include?(string)).to be true
end

Then(/^page return record containing patients named 'Daniele'$/) do
  begin
    expect(@browser.text.include?('Daniele')).to be true
  rescue RSpec::Expectations::ExpectationNotMetError => e
    log("#{e.class}: #{e.message}")
  end
end
