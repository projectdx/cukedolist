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

  private

  def in_component(&blk)
    browser.within(component_locator, &blk)
  end

  def _visible?
    browser.page.has_css?(component_locator)
  end

  def fill_in(locator, options)
    in_component { browser.fill_in(locator, options) }
  end

  def click_on(locator)
    in_component { browser.click_on(locator) }
  end
end
