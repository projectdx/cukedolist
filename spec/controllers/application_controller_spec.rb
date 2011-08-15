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
end
