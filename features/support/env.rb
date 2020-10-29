require 'watir'
require_relative '../../properties/credentials'
require_relative '../../properties/constants'

def wait_visible_text(text)
  Watir::Wait.until(timeout: 10) { @browser.text.include? text.to_s }
end

def set_patients_id(num=1, id)
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

Before do
  @browser = Watir::Browser.new :chrome
  @browser.window.maximize
end

After do |scenario|
  if scenario.failed?
    screenshot_file = "failed_tests/screenshot-#{Time.now.strftime('%Y%m%d-%H%M%S')}.png"
    @browser.driver.save_screenshot(screenshot_file)
    embed screenshot_file, 'image/png;base64'
  end

  @browser.close
end
