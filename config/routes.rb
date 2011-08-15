Cukedolist::Application.routes.draw do
  match '/session/logout' => 'sessions#logout'
  resource :session
  root :to => 'todo_lists#show'
end
