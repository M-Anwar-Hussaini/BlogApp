Rails.application.routes.draw do
  root 'users#index'
  resources :users do
    resources :posts do
      resources :likes
      resources :comments
    end
  end

end
