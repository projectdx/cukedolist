Cukedolist::Application.routes.draw do
  match '/logout' => 'sessions#logout'
  root :to => 'todo_lists#show'
end
