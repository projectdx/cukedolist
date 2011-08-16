require 'app_driver/ui_driver/ui_component'

class AppDriver::UIDriver::TodoList
  include AppDriver::UIDriver::UIComponent

  def _visible?
    %w(/ /todo_list).include?(browser.current_path)
  end
end
