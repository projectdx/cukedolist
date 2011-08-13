require 'spec_helper'

describe AccountsController do
  it_has_singular_resource_routing('accounts')

  describe '#new' do
    it 'responds with a 200 status' do
      get :new
      response.status.should == 200
    end
  end
end
