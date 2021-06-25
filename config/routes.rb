Rails.application.routes.draw do

  devise_for :users
 
  namespace :admin  do 
    resources :users
    
end 
  namespace :manager do
    resources :clients
    resources :projects do
      resources :comments
  end
end

  root to: 'manager/projects#index' 
end
