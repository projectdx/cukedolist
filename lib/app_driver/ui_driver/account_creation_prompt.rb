require 'app_driver/ui_driver/ui_component'

class AppDriver::UIDriver::AccountCreationPrompt
  include AppDriver::UIDriver::UIComponent

  def _visible?
    browser.current_path == '/session/new'
  end

  def follow
    raise 'Account creation prompt not visible' unless visible?
    browser.click_on 'Create an account'
  end
end
