require 'app_driver/ui_driver/ui_component'

class AppDriver::UIDriver::AccountCreationPrompt
  include AppDriver::UIDriver::UIComponent

  def follow
    raise 'Account creation prompt not visible' unless visible?
    browser.click_on 'Create an account'
  end

  private

  def component_locator
    '#account_creation_prompt'
  end
end
