require 'app_driver/ui_driver/ui_component'

class AppDriver::UIDriver::NewAccountForm
  include AppDriver::UIDriver::UIComponent

  def email_address=(email)
    fill_in 'Email address', :with => email
  end

  def password=(password)
    fill_in 'Password', :with => password
  end

  def password_confirmation=(password)
    fill_in 'Password confirmation', :with => password
  end

  def submit
    click_on 'Create Account'
    no_500_error!
  end

  private

  def _visible?
    browser.has_css?('#new_account')
  end

  def component_locator
    '#new_account'
  end
end
