class AppDriver::UIDriver::LoginPrompt
  def initialize(browser)
    @browser = browser
  end

  def visible?
    @browser.current_path == '/session/new'
  end
end
