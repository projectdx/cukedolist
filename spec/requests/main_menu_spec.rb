require 'spec_helper'

describe "Main menu behavior" do
  it 'displays a log out link when the user is signed in' do
    api_driver.create_account
    ui_driver.log_in
    ui_driver.main_menu.should have_logout_link
  end

  it' does not display a log out link when the user is not signed in' do
    ui_driver.go_to_home_page
    ui_driver.main_menu.should_not have_logout_link
  end
end
