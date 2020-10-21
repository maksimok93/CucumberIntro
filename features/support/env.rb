require 'watir'
require_relative '../../properties/credentials'

def wait_visible_text(text)
  Watir::Wait.until(timeout: 10) { @browser.text.include? text.to_s }
end

Before do
  @browser = Watir::Browser.new :chrome
  @browser.window.maximize
end

After do
  @browser.close
end
