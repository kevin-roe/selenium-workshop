require "selenium-webdriver"

class Driver
  def initialize(browser)
    if browser == :chrome
      options = Selenium::WebDriver::Options.chrome
      @webdriver = Selenium::WebDriver.for(:chrome, options:)
    elsif browser == :firefox
      options = Selenium::WebDriver::Options.firefox
      @webdriver = Selenium::WebDriver.for(:firefox, options:)
    end
    @webdriver.manage.timeouts.implicit_wait = 10
  end

  def quit
    @webdriver.quit
  end

  def navigate_to(url)
    @webdriver.get url
  end

  def element(locator)
    elements = @webdriver.find_elements(locator)
    if elements.length > 1
      RSpec::Expectations.fail_with("More than 1 element with locator #{locator}")
    elsif elements.length == 0
      RSpec::Expectations.fail_with("0 elements found with locator #{locator}")
    end
    elements.first
  end

  def set_text(locator, value)
    element(locator).send_keys(value)
  end

  def attribute(locator, attribute)
    element(locator).attribute(attribute)
  end
end
