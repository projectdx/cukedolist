class AppDriver::UIDriver
  Dir[Rails.root.join("lib/app_driver/ui_driver/**/*.rb")].each {|f| require f}

  include HasBrowser

  class << self
    def ui_component(component_name)
      component_class = ('AppDriver::UIDriver::' + component_name.to_s.camelize).constantize

      define_method(component_name) do
        component_class.new(:browser => browser)
      end

      define_method("has_#{component_name}?") do
        send(component_name).visible?
      end
    end
  end

  ui_component :login_form
  ui_component :account_creation_prompt
  ui_component :new_account_form
  ui_component :todo_list
  ui_component :validation_error

  def force_logout
    visit '/session/logout'
  end

  def go_to_home_page
    visit '/'
  end

  def choose_to_create_account
    account_creation_prompt.follow
  end

  def provide_new_account_details(params = {})
    params.reverse_merge!(:email_address => "test-user-#{`uuidgen`.strip}@example.com",
                          :password => 'a valid password',
                          :password_confirmation => 'a valid password')
    new_account_form.email_address = params[:email_address]
    new_account_form.password = params[:password]
    new_account_form.password_confirmation = params[:password_confirmation]
    new_account_form.submit
  end

  def log_in(user_details)
    login_form.email_address = user_details[:email_address]
    login_form.password = user_details[:password]
    login_form.submit
  end
end
