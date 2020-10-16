
Given(/^user open main page$/) do
  @browser.goto('https://demo.openmrs.org/openmrs/login.htm')
end

When(/^user logs in with valid username and password$/) do
  @browser.text_field(id: 'username').set CREDENTIALS[0]
  @browser.text_field(id: 'password').set CREDENTIALS[1]
  @browser.element(css: 'li[id="Inpatient Ward"]').click
  @browser.element(css: 'input[id="loginButton"]').click
end

Then(/^verify page has been loaded$/) do
  expect(@browser.text.include?('Logged in as Super User (admin) at Inpatient Ward.')).to be true
end
