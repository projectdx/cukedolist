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
      visit '/session/logout'
    end

    def go_to_home_page
      visit '/'
    end

    # Queries
    def has_login_prompt?
      LoginPrompt.new(@browser).visible?
    end

    def has_account_creation_prompt?
      account_creation_prompt.visible?
    end

    def account_creation_prompt
      AccountCreationPrompt.new(@browser)
    end
  end
end

# TODO: refactor these out
require File.join(File.dirname(__FILE__), *%w[ui_driver login_prompt])
require File.join(File.dirname(__FILE__), *%w[ui_driver account_creation_prompt])
