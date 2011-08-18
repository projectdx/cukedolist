require 'app_driver/ui_driver/ui_component'

class AppDriver::UIDriver::MainMenu
  include AppDriver::UIDriver::UIComponent

  def log_out
    click_on 'Log Out'
  end

  private

  def component_locator
    '#main_menu'
  end
end
