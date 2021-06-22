Rails.application.routes.draw do
  resources :clients
  resources :users
  devise_for :users
  root to: 'projects#index'
  resources :projects do
    resources :comments
  end
end
