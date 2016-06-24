Rails.application.routes.draw do
# namespace :admin do
#   get 'users/index'
#   get 'users/show'
#   get 'users/create'
#   get 'users/update'
#   get 'users/new'
#   get 'users/destroy'
#   get 'users/edit'
# end
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
