require 'spec_helper'

describe ApplicationController do
  controller do
    def index
      render :text => 'Hello, World!'
    end
  end

  it 'redirects anonymous users to the login page' do
    get :index
    response.should redirect_to new_session_path
  end

  it 'does not redirect logged-in users to the login page' do
    Account.stub(:find => mock_model(Account))
    get :index, {}, :account_id => 42
    response.status.should == 200
  end

  describe '#current_account' do
    context 'when session contains no account_id' do
      it 'returns nil' do
        get :index
        controller.current_account.should be_nil
      end
    end

    context 'when session contains invalid account_id' do
      before(:each) do
        Account.stub!(:find).and_raise(ActiveRecord::RecordNotFound)
        get :index, {}, :account_id => 82
      end

      it 'resets the session' do
        _ = controller.current_account
        session.should be_empty
      end

      it 'returns nil' do
        controller.current_account.should be_nil
      end
    end

    context 'when session contains a valid account_id' do
      it 'returns the matching account object' do
        account = mock_model(Account)
        Account.should_receive(:find).with(82).and_return(account)
        get :index, {}, :account_id => 82
        controller.current_account.should == account
      end

      it 'memoizes the result' do
        account = mock_model(Account)
        Account.should_receive(:find).with(82).once.and_return(account)
        get :index, {}, :account_id => 82
        2.times { controller.current_account.should == account }
      end
    end
  end

  describe '#current_account=' do
    let(:account) { mock_model(Account) }

    it 'sets #current_account to the supplied value' do
      controller.current_account = account
      controller.current_account.should == account
    end

    it 'sets the account_id in the session' do
      controller.current_account = account
      session[:account_id].should == account.id
    end

    it 'only allows Account objects through the door' do
      lambda { controller.current_account = "Hello, World!" }.should raise_error(ArgumentError, "Only objects of type Account can be assigned.")
    end
  end
end
