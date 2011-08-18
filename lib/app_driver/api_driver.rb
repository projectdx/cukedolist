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
    test_data.user['default'] = HashWithIndifferentAccess.new(JSON.parse(last_response.body))[:account]
  end

  def get_account
    user = test_data.user['default']
    if user.nil?
      create_account
    else
      head 'Accept', 'application/json'
      get "/api/v1/accounts/#{user[:id]}"
      raise "Unable to get Account #{user[:id]}" unless last_response.status == 200
      test_data.user['default'] = HashWithIndifferentAccess.new(JSON.parse(last_response.body))[:account]
    end
    test_data.user['default']
  end

  def delete_todo_list
    todo_list_id = get_account.fetch(:todo_list_id)
    unless todo_list_id.nil?
      delete "/api/v1/todo_lists/#{todo_list_id}"
      raise "TodoList deletion failed (#{todo_list_id})" unless last_response.status == 200
      todo_list_id = nil
    end
  end
end
