Rails.application.routes.draw do
  root to: 'tasks#index'
  
  get 'signup', to: 'users#new'
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'

  resources :users, only: [:new, :create]
  #resources :users, only: [:index, :show, :create]
  resources :tasks, only: [:show ,:new, :create, :edit,:update,:destroy]
  #resources :tasks
end

