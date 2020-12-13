Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :songs, only: [:show, :create, :new, :destroy]
  root 'static#home'
  get '/signup', to: 'users#new'
  post '/signup', to: 'users#create'
end
