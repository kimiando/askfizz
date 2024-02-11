Rails.application.routes.draw do
  devise_for :users

  resources :users, only: [:index, :show, :edit, :update]
  resources :questions, only: [:index, :show, :create, :new]

  get 'pages/home'

  # Define your root route
  root to: 'pages#home'
end
