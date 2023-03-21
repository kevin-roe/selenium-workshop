# frozen_string_literal: true

class TextBox
  include RSpec::Matchers

  USER_NAME = { id: "userName" }.freeze

  def initialize(driver)
    @driver = driver
  end

  def set_user_name(value)
    @driver.find_element(USER_NAME).send_keys(value)
  end

  def validate_user_name_value(expected)
    actual = @driver.find_element(USER_NAME).attribute("value")
    expect(expected).to eql actual
  end
end
