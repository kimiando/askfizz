Rails.application.routes.draw do
  devise_for :users

  resources :users do
    collection do
      get 'search', to: 'users#search'
    end
  end

  resources :users, only: [:index, :show, :edit, :update] do
    resources :questions, only: [:index, :show, :create, :new, :destroy] do
      resources :answers, only: [:index,:create, :destroy]
    end
    resource :relationships, only: [:create, :destroy]
    get 'followings' => 'relationships#followings', as: 'followings'
    get 'followers' => 'relationships#followers', as: 'followers'
  end

  # Define your root route
  root to: 'pages#home'
  get '/users/:user_id/questions/:question_id/answers/new', to: 'answers#new', as: 'new_user_question_answer'
end
