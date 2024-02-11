Rails.application.routes.draw do
  devise_for :users

  resources :users, only: [:index, :show]
  resources :questions

  get 'pages/home'

  # Define your root route
  root to: 'pages#home'
end
