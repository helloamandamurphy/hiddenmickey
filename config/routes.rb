Rails.application.routes.draw do
  resources :users, only: [:new, :create, :show]
  resources :pins

  root 'sessions#home'
  get '/signup', to: 'users#new'
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  get '/logout', to: 'sessions#destroy', via: 'delete'
end
