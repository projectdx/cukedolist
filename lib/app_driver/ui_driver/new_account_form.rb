require 'app_driver/ui_driver/ui_component'

class AppDriver::UIDriver::NewAccountForm
  include AppDriver::UIDriver::UIComponent

  def _visible?
    browser.current_path == '/account/new'
  end

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

  def fill_in(locator, options)
    in_component { browser.fill_in(locator, options) }
  end

  def click_on(locator)
    in_component { browser.click_on(locator) }
  end

  def in_component(&blk)
    browser.within('#new_account', &blk)
  end
end
