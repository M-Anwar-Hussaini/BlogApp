Rails.application.routes.draw do
  devise_for :users
  root 'users#index'
  resources :users do
    resources :posts do
      resources :likes
      resources :comments
    end
  end

  namespace :api, defaults: { format: :json } do
    resources :sessions
    resources :posts, only: [:index] do
      resources :comments, only: [:index, :create]
    end
  end
end
