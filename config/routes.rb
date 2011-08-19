Cukedolist::Application.routes.draw do
  resource :user
  resource :session
  match '/session/logout' => 'sessions#logout', :as => 'logout_session'
  resource :todo_list
  namespace :api do
    namespace :v1 do
      resources :users
    end
  end
  root :to => 'todo_lists#show'
end
