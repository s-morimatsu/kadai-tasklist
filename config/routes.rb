Rails.application.routes.draw do
  root to: 'tasks#index'
  
  get 'signup', to: 'users#new'
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'
  

  
  # 2022/04/01 3:56:53
  resources :users, only: [:index, :show, :new, :create]
  #resources :tasks, only: [:new, :create, :destroy]
  resources :tasks
end

