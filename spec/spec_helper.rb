require_relative "../driver"
require_relative "../pages/text_box"

RSpec.configure do |config|
  config.before(:each) do
    @driver = Driver.new(:chrome)

    @text_box = TextBoxPage.new(@driver)
  end

  config.after(:each) do
    @driver.quit
  end
end
