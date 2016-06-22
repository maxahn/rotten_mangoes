Rails.application.routes.draw do
  get 'sessions/new'

  get 'sessions/create'

  get 'users/new'
  get 'users/create'

  resources :sessions, only: [:new, :create, :destroy]
  resources :movies
  resources :users, only: [:new, :create]

end
