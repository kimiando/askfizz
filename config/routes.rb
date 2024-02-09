Rails.application.routes.draw do
  devise_for :users
  resources :users, only: %i[ index show ]
  get 'pages/home'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  root to: 'pages#home'
end
