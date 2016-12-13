Rails.application.routes.draw do

  post 'user_token' => 'user_token#create'
  root 'home#index'
  resources :users, only: [:create, :new, :index]
  get "users/:id", to: "users#like"
  get "user", to: "users#current_user_id"
  get "matches", to: "users#match"
  resources :sessions, only: [:new, :create] do
    delete :destroy, on: :collection
  end


end
