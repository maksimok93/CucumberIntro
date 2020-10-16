
Given(/^user goes to Find Patient Record page$/) do
  @browser.goto('https://demo.openmrs.org/openmrs/login.htm')
  @browser.text_field(id: 'username').set CREDENTIALS[0]
  @browser.text_field(id: 'password').set CREDENTIALS[1]
  @browser.element(css: 'li[id="Inpatient Ward"]').click
  @browser.element(css: 'input[id="loginButton"]').click
end

When(/^user search for patient 'John'$/) do
  @browser.element(xpath: '//a[text()[contains(.,"Find Patient Record")]]').click
  @browser.text_field(id: 'patient-search').set 'John'
end

Then(/^page return records containing patients named 'John'$/) do
  expect(@browser.text.include?('John Thompson')).to be true
end
