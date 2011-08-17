Cukedolist::Application.routes.draw do
  resource :account
  resource :session
  match '/session/logout' => 'sessions#logout'
  resource :todo_list
  namespace :api do
    namespace :v1 do
      resources :accounts
    end
  end
  root :to => 'todo_lists#show'
end
