require 'spec_helper'

describe TodoListsController do
  describe '#show' do
    it 'should be routed from the root path' do
      {:get => '/'}.should route_to(:controller => 'todo_lists', :action => 'show')
    end

    context 'when the user is not logged in' do
      it 'redirects to the login page' do
        get :show
        response.should redirect_to new_session_path
      end
    end
  end
end
