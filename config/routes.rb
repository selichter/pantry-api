Rails.application.routes.draw do
  mount_devise_token_auth_for 'User', at: 'auth'
  root 'application#index'
  namespace :api do
    namespace :v1 do
      resources :items, only: [:index, :create, :update, :show]
      resources :locations, only: [:index, :create, :show]
    end
  end

end
