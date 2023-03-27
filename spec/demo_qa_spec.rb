describe "Demo QA" do
  it "should work" do
    @driver.navigate_to "https://demoqa.com/text-box"

    @text_box.set_user_name("Kevin")
    @text_box.validate_user_name("Kevin")
  end
end
