require 'capybara/rspec'
require 'app_driver'

module AppDriver::RSpec
  def ui_driver
    @ui_driver ||= AppDriver::UIDriver.new(:browser => Capybara.current_session)
  end

  def api_driver
    @api_driver ||= AppDriver::APIDriver.new(:app => Capybara.app)
  end
end

RSpec.configure do |c|
  c.include(AppDriver::RSpec, :type => :request)
end
