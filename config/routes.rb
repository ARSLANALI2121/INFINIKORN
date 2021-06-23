Rails.application.routes.draw do
  resources :clients
  devise_for :users
  resources :users
  root to: 'projects#index'
  resources :projects do
    resources :comments
  end
  
end
