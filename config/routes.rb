Rails.application.routes.draw do
  devise_for :users
  root 'users#index'
  resources :users do
    resources :posts do
      resources :likes
      resources :comments
    end
  end



  namespace :api do
    namespace :v1 do
      resources :users do
        resources :posts do
          resources :comments
        end
      end
    end
  end

  
  

end
