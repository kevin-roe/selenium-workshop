require "selenium-webdriver"

class Driver
  attr_reader :webdriver

  def initialize(browser)
    options = if browser == :chrome
                Selenium::WebDriver::Options.chrome
              elsif browser == :firefox
                Selenium::WebDriver::Options.firefox
              else
                raise StandardError, "Browser #{browser} is not supported."
              end

    @webdriver = Selenium::WebDriver.for(browser, options: options)
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

  def click(locator)
    element(locator).click
  end
end
