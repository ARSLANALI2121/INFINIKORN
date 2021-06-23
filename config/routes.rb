Rails.application.routes.draw do

  devise_for :users

  namespace :admin  do 
    resources :users
end 

  resources :projects do
    resources :comments
end
  resources :clients

  root to: 'projects#index' 
end
