Rails.application.routes.draw do
  resources :users, only: [:new, :create, :show]
  resources :pins
  resources :series

  resources :series do
    resources :pins, only: [:new, :create, :index]
  end

  root 'sessions#home'
  get '/signup', to: 'users#new'
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
end
