Cukedolist::Application.routes.draw do
  resource :account
  resource :session
  match '/session/logout' => 'sessions#logout'
  resource :todo_list
  root :to => 'todo_lists#show'
end
