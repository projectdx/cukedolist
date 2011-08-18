require 'app_driver'

def ui_driver
  @ui_driver
end

def api_driver
  @api_driver
end

Before do
  test_data = AppDriver::TestData.new
  @ui_driver = AppDriver::UIDriver.new(:browser => Capybara.current_session,
                                       :test_data => test_data)
  @api_driver = AppDriver::APIDriver.new(:app => Capybara.app,
                                         :test_data => test_data)
end
