class AppDriver::APIDriver
  include Rack::Test::Methods

  attr_reader :app, :test_data

  def initialize(opts)
    @app = opts.fetch(:app)
    @test_data = opts.fetch(:test_data)
  end

  def create_account
    email = "test-user-#{`uuidgen`.strip}@example.com"
    password = "a password"
    account_json = {
      'account' => {
        'email_address' => email,
        'password' => password
      }
    }.to_json
    header 'Content-Type', 'application/json'
    header 'Accept', 'application/json'
    post '/api/v1/accounts', account_json
    raise "Account creation failed (#{last_response.status})" unless last_response.status == 201
    test_data.user['default'] = {:email_address => email, :password => password}
  end
end
