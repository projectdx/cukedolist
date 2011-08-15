require 'spec_helper'

describe SessionsController do
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
  end
end
