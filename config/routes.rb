Rails.application.routes.draw do
  root 'application#index'

  resources :items, only: [:index, :create]
end
