require 'app_driver'

def ui_driver
  @ui_driver
end

def api_driver
  @api_driver
end

Before do
  @ui_driver = AppDriver::UIDriver.new(:browser => self)
  @api_driver = AppDriver::APIDriver.new(:app => Capybara.app)
end
