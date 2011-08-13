module AppDriver
  class UIDriver
    class Unexpected500 < Exception
    end

    def initialize(browser)
      @browser = browser
    end

    def visit(*args)
      @browser.visit *args
      raise Unexpected500 if @browser.page.has_css?('head title', :text => 'Internal Server Error')
    end

    def force_logout
      visit '/logout'
    end
  end
end
