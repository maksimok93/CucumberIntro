
Given(/^user goes to Find Patient Record page$/) do
  log_in_as_admin
  @browser.element(xpath: '//a[text()[contains(.,"Find Patient Record")]]').click
end

When(/^user search for patient 'John'$/) do
  @browser.text_field(id: 'patient-search').set 'John'
end

Then(/^page return records containing patients named 'John'$/) do
  wait_visible_text('John Thompson')
  expect(@browser.text.include?('John Thompson')).to be true
end
