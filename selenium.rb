# frozen_string_literal: true

require "selenium-webdriver"

begin
  options = Selenium::WebDriver::Options.chrome
  driver = Selenium::WebDriver.for(:chrome, options:)
  driver.get "https://demoqa.com/text-box"
  driver.manage.timeouts.implicit_wait = 10
  elem = driver.find_element(id: "userName")
  elem.send_keys("Kevin Roe")
ensure
  driver.quit
end
