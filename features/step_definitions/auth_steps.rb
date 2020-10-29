
Given(/^user opens main page$/) do
  @browser.goto('https://demo.openmrs.org/openmrs/login.htm')
end

When(/^user enters valid username and password$/) do
  @browser.text_field(id: 'username').set CREDENTIALS[0]
  @browser.text_field(id: 'password').set CREDENTIALS[1]
  @browser.element(css: MainPageLocators::INPATIENT_WARD).click
  @browser.element(css: MainPageLocators::LOGIN).click
end

Then(/^user entered successfully$/) do
  expect(@browser.text.include?('Logged in as Super User (admin) at Inpatient Ward.')).to be true
end
