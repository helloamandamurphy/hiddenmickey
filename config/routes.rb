Rails.application.routes.draw do
  resources :users, only: [:new, :create, :show]
  resources :pins

  get '/signin', to: 'sessions#new'
  post '/signin', to: 'sessions#create'
  get '/signout', to: 'sessions#destroy', via: 'delete'
end
