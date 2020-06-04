Rails.application.routes.draw do
  mount_devise_token_auth_for 'User', at: 'auth'
  root 'application#index'

  resources :items, only: [:index, :create, :update, :show]
end
