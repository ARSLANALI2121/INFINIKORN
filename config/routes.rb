Rails.application.routes.draw do
  get 'payments/index'
  get 'payments/new'
  get 'payments/show'
  get 'payments/edit'
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
