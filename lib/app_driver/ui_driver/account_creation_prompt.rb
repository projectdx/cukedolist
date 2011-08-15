class AppDriver::UIDriver::AccountCreationPrompt
  def initialize(browser)
    @browser = browser
  end

  def visible?
    @browser.current_path == '/session/new'
  end

  def follow
    raise 'Account creation prompt not visible' unless visible?
    @browser.click_on 'Create an account'
  end
end
