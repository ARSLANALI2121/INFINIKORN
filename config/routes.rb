Rails.application.routes.draw do
  devise_for :users
 
  namespace :admin  do 
    resources :users
    resources :projects do
      resources :comments
  end
end 

  resources :clients
  root to: 'admin/projects#index' 
end
