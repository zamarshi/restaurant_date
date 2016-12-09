Rails.application.routes.draw do

  root 'home#index'
  resources :users, only: [:create, :new, :index]
  get "users/:id", to: "users#like"
  resources :sessions, only: [:new, :create] do
    delete :destroy, on: :collection
  end


end
