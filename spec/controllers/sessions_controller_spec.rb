require 'spec_helper'

describe SessionsController do
  it_has_singular_resource_routing('sessions')

  describe '#logout' do
    it 'resets the session' do
      session[:foo] = 'bar'
      get :logout
      session.should_not have_key(:foo)
    end

    it 'redirects the user to the root path' do
      get :logout
      response.should redirect_to root_path
    end
  end

  describe '#new' do
    it 'responds with a 200 status code' do
      get :new
      response.status.should == 200
    end

    it 'renders the login page template' do
      get :new
      response.should render_template('sessions/new')
    end

    it 'sets #login_session to a new LoginSession' do
      get :new
      controller.login_session.should == LoginSession.new
    end
  end

  describe '#create' do
    context 'with valid data' do
      let(:account) { mock_model(Account) }

      before(:each) do
        login_session = mock_model(LoginSession, :account => account)
        LoginSession.should_receive(:create!) \
          .with('email_address' => 'test@example.com', 'password' => 'foo') \
          .and_return(login_session)
        post :create, :login_session => {
          :email_address => 'test@example.com',
          :password => 'foo'
        }
      end

      it 'logs the user in' do
        controller.current_account.should == account
      end

      it 'redirects to the todo list' do
        response.should redirect_to todo_list_path
      end
    end

    context 'with invalid data' do
      let(:login_session) { mock_model(LoginSession) }

      before(:each) do
        exception = LoginSession::AccessDenied.new("no", login_session)
        LoginSession.stub!(:create!).and_raise(exception)
        post :create, :login_session => {
          :email_address => 'test@example.com',
          :password => 'foo'
        }
      end

      it 'does not log the user in' do
        controller.current_account.should be_nil
      end

      it 'responds with a 403 status' do
        response.status.should == 403
      end

      it 'renders the login template' do
        response.should render_template('sessions/new')
      end

      it 'sets #login_session to the invalid LoginSession' do
        controller.login_session.should == login_session
      end
    end
  end
end
