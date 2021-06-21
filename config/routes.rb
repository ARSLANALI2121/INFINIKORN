Rails.application.routes.draw do

  get 'projects/index'
  get 'projects/new'
  get 'projects/show'
  get 'projects/edit'
  devise_for :users
  root to: 'projects#index'
  resources :projects do
    resources :comments
  end
end
