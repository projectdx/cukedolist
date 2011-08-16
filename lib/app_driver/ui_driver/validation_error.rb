require 'app_driver/ui_driver/ui_component'

class AppDriver::UIDriver::ValidationError
  include AppDriver::UIDriver::UIComponent

  def _visible?
    browser.page.has_css?('#form_validation_error')
  end
end
