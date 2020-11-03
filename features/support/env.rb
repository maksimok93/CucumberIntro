require 'watir'
require_relative 'common_methods'

Before do
  @browser = Watir::Browser.new :chrome
  @browser.window.maximize
end

After do |scenario|
  if scenario.failed?
    if directory_exists?('failed_tests/')
      screenshot_file = "failed_tests/screenshot-#{Time.now.strftime('%Y%m%d-%H%M%S')}.png"
      @browser.driver.save_screenshot(screenshot_file)
    end
  end

  @browser.close
end
