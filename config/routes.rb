Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  #get "todos", to: "todos#index"
  #post "todos/create", to:"todos#create"
  #get "todos/:id", to:"todos#show"

  #get "/" => "home#index"
  root to: "home#index"
  resources :todos
  resources :users
  get "/signin" => "sessions#new", as: :new_sessions
  post "/signin" => "sessions#create", as: :sessions
  #post "users/login", to: "users#login"
  delete "/signout" => "sessions#destroy", as: :destroy_session
end
