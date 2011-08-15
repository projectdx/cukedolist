require 'app_driver'

def ui_driver
  @ui_driver
end

Before do
  @ui_driver = AppDriver::UIDriver.new(:browser => self)
end