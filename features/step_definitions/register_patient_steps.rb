
Given(/^go to Login page and log in$/) do
  @browser.goto('https://demo.openmrs.org/openmrs/login.htm')
  @browser.text_field(id: 'username').set CREDENTIALS[0]
  @browser.text_field(id: 'password').set CREDENTIALS[1]
  @browser.element(css: 'li[id="Inpatient Ward"]').click
  @browser.element(css: 'input[id="loginButton"]').click
end

And(/^Choose Register page$/) do
  @browser.element(xpath: '//a[text()[contains(.,"Register a patient")]]').click
end

And(/^Fill required fields in Name tab$/) do
  wait_visible_text("What's the patient's name?")
  @browser.text_field(name: 'givenName').set 'Mike'
  @browser.text_field(name: 'familyName').set 'Abrams'
end

And(/^Choose gender$/) do
  @browser.element(id: 'genderLabel').click
  @browser.element(css: 'option[value="M"]').click
end

And(/^Fill birthdate field$/) do
  @browser.element(id: 'birthdateLabel').click
  @browser.text_field(name: 'birthdateDay').set '22'
  @browser.select_list(name: 'birthdateMonth').click
  @browser.option(text: 'February').click
  @browser.text_field(name: 'birthdateYear').set '1993'
end

And(/^Fill address field$/) do
  @browser.element(xpath: '//span[text()[contains(.,"Address")]]').click
  @browser.text_field(id: 'address1').set '5th avenue'
end

When(/^User confirm registration$/) do
  @browser.element(id: 'confirmation_label').click
  @browser.element(id: 'submit').click
end

Then(/^page return register success message$/) do
  wait_visible_text('Created Patient Record: Mike Abrams')
  expect(@browser.text.include?('Created Patient Record: Mike Abrams')).to be true
end
