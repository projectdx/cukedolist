require 'app_driver/ui_driver/ui_component'

class AppDriver::UIDriver::LoginPrompt
  include AppDriver::UIDriver::UIComponent

  def _visible?
    browser.current_path == '/session/new'
  end
end
