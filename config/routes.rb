Cukedolist::Application.routes.draw do
  resource :account
  resource :session
  match '/session/logout' => 'sessions#logout'
  root :to => 'todo_lists#show'
end
