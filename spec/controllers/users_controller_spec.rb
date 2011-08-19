require 'spec_helper'

describe UsersController do
  it_has_singular_resource_routing('users')

  describe '#new' do
    it 'responds with a 200 status' do
      get :new
      response.status.should == 200
    end

    it 'renders the new user template' do
      get :new
      response.should render_template('users/new')
    end

    it 'sets #account to a new account record' do
      get :new
      controller.account.should be_new_record(Account)
    end
  end

  describe '#create' do
    context 'with valid data' do
      let(:valid_data) do
        {
          'email_address' => 'test-user@example.com',
          'password' => 'a password',
          'password_confirmation' => 'a password'
        }
      end

      let(:account) { mock_model(Account) }

      before(:each) do
        Account.stub!(:create! => account)
      end

      it 'creates an account' do
        Account.should_receive(:create!).with(valid_data).and_return(account)
        post :create, :account => valid_data
      end

      it 'logs the user in to the created account' do
        post :create, :account => valid_data
        controller.current_account.should == account
      end

      it "redirects to the user's todo list" do
        post :create, :account => valid_data
        response.should redirect_to todo_list_path
      end
    end

    context 'with invalid data' do
      let(:account) do
        mock_model(Account).tap do |m|
          m.stub(:errors => stub(:full_messages => %w(one two three)))
        end
      end

      before(:each) do
        exception = ActiveRecord::RecordInvalid.allocate
        exception.stub!(:record => account)
        Account.stub!(:create!).and_raise(exception)
        post :create, :account => {:email_address => 'invalid', :password => 'more invalid', :password_confirmation => 'most invalid'}
      end

      it 'responds with a 403 status' do
        response.status.should == 403
      end

      it 'renders the new user template' do
        response.should render_template('users/new')
      end

      it 'sets account to the invalid account record' do
        controller.account.should == account
      end

      it "sets #errors to the full_messages for the account's errors" do
        controller.errors.should == %w(one two three)
      end
    end
  end

  describe '#errors' do
    it 'defaults to an empty array' do
      controller.errors.should == []
    end
  end
end
