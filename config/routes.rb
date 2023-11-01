# frozen_string_literal: true

Rails.application.routes.draw do

  root "users#index"
  resources :users, only: [:index, :show] do
    resources :posts, only: [:index, :show]
  end

  # get '/users', to: 'users#index'
  # get '/users/:user_id', to: 'users#show', as: 'user'
  # get '/users/:user_id/posts', to: 'posts#index', as: 'user_posts'
  # get '/users/:user_id/posts/:post_id', to: 'posts#show', as: 'user_post'
end
