Rails.application.routes.draw do

  devise_for :users
 
  namespace :admin  do 
    resources :users do 
      member do
        get :deactivate
        get :activate
      end
    # get "/deactivate", to: "users#deactivate"
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
