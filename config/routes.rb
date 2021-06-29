Rails.application.routes.draw do

  devise_for :users, controllers: {sessions: 'sessions'}
 
  namespace :admin  do 
    resources :users do 
      member do
        get :user_activation
      end
    end
end 

namespace :manager do
    resources :clients do 
      resources :projects do
        resources :comments
    end
  end
end

  root to: 'manager/clients#index' 
end
