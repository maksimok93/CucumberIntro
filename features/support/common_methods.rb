require_relative '../../properties/credentials'
require_relative '../../properties/constants'

def wait_visible_text(text)
  Watir::Wait.until(timeout: 10) { @browser.text.include? text.to_s }
end

def set_patients_id(id, num = 1)
  @browser.text_field(id: "patient#{num.to_i}-text").set id.to_s
end

def log_in_as_admin
  @browser.goto('https://qa-refapp.openmrs.org/openmrs/')
  # @browser.goto('https://demo.openmrs.org/openmrs/login.htm')
  @browser.text_field(id: 'username').set CREDENTIALS[0]
  @browser.text_field(id: 'password').set CREDENTIALS[1]
  @browser.element(css: MainPageLocators::INPATIENT_WARD).click
  @browser.element(css: MainPageLocators::LOGIN).click
end

def directory_exists?(directory)
  File.directory?(directory)
end
