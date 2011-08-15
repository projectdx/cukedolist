module AppDriver::UIDriver::HasBrowser
  Unexpected500 = Class.new(StandardError)

  # This will fail if the options hash does not include a value for the key :browser
  def initialize(options = {})
    super
    @browserish = options.fetch(:browser)
  end
  
  def browser
    @browserish
  end

  def visit(*args)
    browser.visit *args
    no_500_error!
  end

  def no_500_error!
    raise Unexpected500 if browser.page.has_css?('head title', :text => 'Internal Server Error')
  end
end
