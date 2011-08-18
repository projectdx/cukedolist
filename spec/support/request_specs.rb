require 'capybara/rspec'
require 'app_driver'

module AppDriver::RSpec
  def test_data
    @test_data ||= AppDriver::TestData.new
  end

  def ui_driver
    @ui_driver ||= AppDriver::UIDriver.new(:browser => Capybara.current_session, :test_data => test_data)
  end

  def api_driver
    @api_driver ||= AppDriver::APIDriver.new(:app => Capybara.app, :test_data => test_data)
  end
end

RSpec.configure do |c|
  c.include(AppDriver::RSpec, :type => :request)
end
