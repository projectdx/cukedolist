require 'app_driver/ui_driver/ui_component'

class AppDriver::UIDriver::ValidationError
  include AppDriver::UIDriver::UIComponent

  private

  def component_locator
    '#form_validation_error'
  end
end
