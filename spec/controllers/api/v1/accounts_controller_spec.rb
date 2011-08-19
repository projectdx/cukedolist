require 'spec_helper'

describe Api::V1::AccountsController do
  it_has_resource_routing('api/v1/accounts', 'api/v1/users')

  describe '#create' do
    context 'with valid data' do
      let(:valid_data) do
        {
          'email_address' => 'test-user@example.com',
          'password' => 'a password'
        }
      end

      let(:account) { mock_model(Account, :to_json => "{'foo':'bar'}") }

      before(:each) do
        Account.stub!(:create! => account)
      end

      it 'creates an account' do
        Account.should_receive(:create!).with(valid_data).and_return(account)
        post :create, :account => valid_data
      end

      it 'returns the JSON representation of the new account' do
        post :create, :account => valid_data
        response.content_type.should == 'application/json'
        response.body.should == account.to_json
      end
    end

    context 'with invalid data' do
      let(:account) { mock_model(Account) }

      before(:each) do
        account.stub!(:errors => stub(:full_messages => %w(msg_one msg_two)))
        exception = ActiveRecord::RecordInvalid.allocate
        exception.stub!(:record => account)
        Account.stub!(:create!).and_raise(exception)
        post :create, :account => {:email_address => 'invalid', :password => 'more invalid', :password_confirmation => 'most invalid'}
      end

      it 'responds with a 403 status' do
        response.status.should == 403
      end

      it 'renders the validations error messages as JSON' do
        response.content_type.should == 'application/json'
        response.body.should == %w(msg_one msg_two).to_json
      end
    end
  end
end
