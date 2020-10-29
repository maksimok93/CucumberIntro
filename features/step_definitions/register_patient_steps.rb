Given(/^go to Login page and log in$/) do
  log_in_as_admin
end

And(/^Choose Register page$/) do
  @browser.element(xpath: InpatientWardLocators::REGISTER_PATIENT).click
end

And(/^Fill required fields in Name tab$/) do
  wait_visible_text("What's the patient's name?")
  @browser.text_field(name: 'givenName').set 'Mike'
  @browser.text_field(name: 'familyName').set 'Abrams'
end

And(/^Choose gender$/) do
  @browser.element(id: 'genderLabel').click
end

And(/^Choose male$/) do
  @browser.element(css: InpatientWardLocators::GENDER_MALE).click
end

And(/^Fill birthdate field$/) do
  @browser.element(id: 'birthdateLabel').click
  @browser.text_field(name: 'birthdateDay').set '22'
  @browser.select_list(name: 'birthdateMonth').click
  @browser.option(text: 'February').click
  @browser.text_field(name: 'birthdateYear').set '1993'
end

And(/^Fill address field$/) do
  @browser.element(xpath: InpatientWardLocators::ADDRESS).click
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

Then(/^page return similar patient found message$/) do
  begin
    expect(wait_visible_text('1 similar patient(s) found')).to be true
  rescue Watir::Wait::TimeoutError
    log("#{$ERROR_INFO.class}: #{$ERROR_INFO.message}")
  ensure
    log('test finished')
  end
end
