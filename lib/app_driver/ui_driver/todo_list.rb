require 'app_driver/ui_driver/ui_component'

class AppDriver::UIDriver::TodoList
  include AppDriver::UIDriver::UIComponent

  private

  def component_locator
    '#todo_list'
  end
end
