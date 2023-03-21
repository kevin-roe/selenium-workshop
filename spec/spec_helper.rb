require "selenium-webdriver"
require_relative "../pages/text_box"

RSpec.configure do |config|
  config.before(:each) do
    options = Selenium::WebDriver::Options.chrome
    @driver = Selenium::WebDriver.for(:chrome, options:)
    @driver.manage.timeouts.implicit_wait = 10

    @text_box = TextBox.new(@driver)
  end

  config.after(:each) do
    @driver.quit
  end
end
