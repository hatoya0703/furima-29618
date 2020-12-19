Rails.application.routes.draw do
  root "items#index"
  devise_for :users
  root to: 'items#index'
  resources :items
end
