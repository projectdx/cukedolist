require 'spec_helper'

describe LoginSession do
  describe '.new' do
    it 'sets the email_address if present in attributes hash' do
      a = LoginSession.new(:email_address => 'test@example.com')
      a.email_address.should == 'test@example.com'
    end

    it 'sets the password if present in attributes hash' do
      a = LoginSession.new(:password => 'foo')
      a.password.should == 'foo'
    end
  end

  describe '#authenticate!' do
    context 'when email_address and password match an existing account' do
      it 'sets #account to the matched account object' do
        account = mock_model(Account)
        Account.should_receive(:find_by_email_address_and_password) \
          .with('test@example.com', 'foo') \
          .and_return(account)
        login_session = LoginSession.new(:email_address => 'test@example.com', :password => 'foo')
        login_session.authenticate!
        login_session.account.should == account
      end
    end

    context 'when email_address and password do not match an existing account' do
      it 'raises an AccessDenied exception' do
        Account.should_receive(:find_by_email_address_and_password) \
          .with('test@example.com', 'foo') \
          .and_return(nil)
        login_session = LoginSession.new(:email_address => 'test@example.com', :password => 'foo')
        lambda { login_session.authenticate! }.should raise_exception(LoginSession::AccessDenied)
      end
    end
  end

  describe '#==' do
    it 'returns true if both objects have the same email_address and password attributes' do
      a = LoginSession.new(:email_address => 'test@example.com', :password => 'foo')
      b = LoginSession.new(:email_address => 'test@example.com', :password => 'foo')
      a.should == b
    end

    it 'returns false if both objects do not have the same email_address' do
      a = LoginSession.new(:email_address => 'test@example.com', :password => 'foo')
      b = LoginSession.new(:email_address => 'test2@example.com', :password => 'foo')
      a.should_not == b
    end

    it 'returns false if both objects do not have the same password' do
      a = LoginSession.new(:email_address => 'test@example.com', :password => 'foo')
      b = LoginSession.new(:email_address => 'test@example.com', :password => 'foo2')
      a.should_not == b
    end
  end

  describe '#persisted?' do
    it 'always returns false' do
      LoginSession.new.should_not be_persisted
    end
  end

  describe '.create!' do
    let(:login_session) { mock_model(LoginSession) }

    before(:each) do
      LoginSession.should_receive(:new).with(:email_address => 'test@example.com', :password => 'foo').and_return(login_session)
    end

    context 'when authentication is successful' do
      it 'returns a LoginSession instance initialized with the supplied arguments' do
        login_session.should_receive(:authenticate!)
        LoginSession.create!(:email_address => 'test@example.com', :password => 'foo').should == login_session
      end
    end

    context 'when authentication fails' do
      it 'raises an AccessDenied exception' do
        login_session.should_receive(:authenticate!).and_raise(LoginSession::AccessDenied.new('No!', login_session))
        lambda { LoginSession.create!(:email_address => 'test@example.com', :password => 'foo') }.should \
          raise_error(LoginSession::AccessDenied)
      end
    end
  end

  describe LoginSession::AccessDenied do
    describe '#login_session' do
      it 'returns the LoginSession with which it was instantiated' do
        login_session = mock_model(LoginSession)
        exception = LoginSession::AccessDenied.new("No", login_session)
        exception.login_session.should == login_session
      end
    end
  end
end
