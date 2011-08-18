require 'spec_helper'

describe "Logging in" do
  it 'does not display an authentication failure message before a login attempt is made' do
    ui_driver.force_logout
    ui_driver.go_to_home_page
    ui_driver.should have_login_form
    ui_driver.should_not have_authentication_failure_message
    ui_driver.log_in(:email_address => 'wrong@example.com', :password => 'incorrect')
    ui_driver.should have_login_form
    ui_driver.should have_authentication_failure_message
  end
end
