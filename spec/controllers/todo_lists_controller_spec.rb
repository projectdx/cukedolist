require 'spec_helper'

describe TodoListsController do
  it_has_singular_resource_routing('todo_lists')

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

    context 'when the user is logged in' do
      it 'renders the show template' do
        Account.stub!(:find => mock_model(Account))
        get :show, {}, :account_id => 42
        response.should render_template('todo_lists/show')
      end
    end
  end
end
