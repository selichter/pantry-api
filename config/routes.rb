Rails.application.routes.draw do
  root 'application#index'
  resource :items, only: [:create]
end
