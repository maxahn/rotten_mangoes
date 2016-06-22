Rails.application.routes.draw do
  namespace :admin do
  get 'users/index'
  end

  namespace :admin do
  get 'users/show'
  end

  namespace :admin do
  get 'users/create'
  end

  namespace :admin do
  get 'users/update'
  end

  namespace :admin do
  get 'users/new'
  end

  namespace :admin do
  get 'users/destroy'
  end

  namespace :admin do
  get 'users/edit'
  end

  get 'reviews/new'
  get 'reviews/create'

  get 'sessions/new'
  get 'sessions/create'

  get 'users/new'
  get 'users/create'

  resources :movies do 
    resources :reviews, only: [:new, :create]
  end

  resources :users, only: [:new, :create]
  resources :sessions, only: [:new, :create, :destroy]

  namespace :admin do
    resources :users 
  end
  root to: 'movies#index'

end
