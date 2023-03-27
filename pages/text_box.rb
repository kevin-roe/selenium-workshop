# frozen_string_literal: true

class TextBoxPage
  include RSpec::Matchers

  USER_NAME = { id: "userName" }.freeze

  def initialize(driver)
    @driver = driver
  end

  def set_user_name(value)
    @driver.set_text(USER_NAME, value)
  end

  def validate_user_name(expected)
    actual = @driver.attribute(USER_NAME, "value")
    expect(expected).to eql actual
  end
end
