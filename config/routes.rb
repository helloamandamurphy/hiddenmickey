Rails.application.routes.draw do
  resources :users, only: [:new, :create, :show]
  get '/pins/for_trade' => 'pins#for_trade'
  resources :pins
  resources :series

  resources :series do
    resources :pins, only: [:new, :create]
  end

  root 'sessions#home'
  get '/signup', to: 'users#new'
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'

  get '/auth/google_oauth2/callback' => 'sessions#omniauth'
end
