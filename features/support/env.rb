require 'watir'
require_relative '../../properties/credentials'
require_relative '../../properties/locators'

def wait_visible_text(text)
  Watir::Wait.until(timeout: 10) { @browser.text.include? text.to_s }
end

def log_in_as_admin
  @browser.goto('https://qa-refapp.openmrs.org/openmrs/')
  # @browser.goto('https://demo.openmrs.org/openmrs/login.htm')
  @browser.text_field(id: 'username').set CREDENTIALS[0]
  @browser.text_field(id: 'password').set CREDENTIALS[1]
  @browser.element(css: 'li[id="Inpatient Ward"]').click
  @browser.element(css: 'input[id="loginButton"]').click
end

Before do
  @browser = Watir::Browser.new :chrome
  @browser.window.maximize
end

After do
  @browser.close
end
