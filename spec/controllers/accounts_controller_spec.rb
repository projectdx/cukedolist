require 'spec_helper'

describe AccountsController do
  it_has_singular_resource_routing('accounts')

  describe '#new' do
    it 'responds with a 200 status' do
      get :new
      response.status.should == 200
    end

    it 'renders the new account template' do
      get :new
      response.should render_template('accounts/new')
    end

    it 'sets #account to a new account record' do
      get :new
      controller.account.should be_new_record(Account)
    end
  end
end
