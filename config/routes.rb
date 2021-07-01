Rails.application.routes.draw do

  devise_for :users, controllers: {sessions: 'sessions'}
 
  namespace :admin  do 
    resources :users do 
      member do
        get :toggle_activation
      end
    end
end 

namespace :manager do
    resources :clients do 
      resources :projects do
        resources :payments
        resources :comments
    end
  end
  # resources :payments
end

  root to: 'manager/clients#index' 
end
