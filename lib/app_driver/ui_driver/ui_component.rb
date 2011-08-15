require 'app_driver/ui_driver/has_browser'

module AppDriver::UIDriver::UIComponent
  # NOTE:  this depends on HasBrowser, and will include it if it isn't already there
  def self.included(receiver)
    unless receiver.ancestors.include?(AppDriver::UIDriver::HasBrowser)
      receiver.module_eval do
        include AppDriver::UIDriver::HasBrowser
      end
    end
  end

  def visible?
    no_500_error!
    _visible?
  end

  def _visible?
    raise "Including class's responsibility!"
  end
end
