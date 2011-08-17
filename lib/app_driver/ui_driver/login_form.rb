require 'app_driver/ui_driver/ui_component'

class AppDriver::UIDriver::LoginForm
  include AppDriver::UIDriver::UIComponent

  def email_address=(email)
    fill_in 'Email address', :with => email
  end

  def password=(password)
    fill_in 'Password', :with => password
  end

  def submit
    click_on 'Log In'
    no_500_error!
  end

  private

  def _visible?
    browser.current_path == '/session/new'
  end

  def component_locator
    '#new_login_session'
  end
end
