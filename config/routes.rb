Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :songs, only: [:show, :create, :new, :destroy]
  resources :users do
    resources :posts, only: [:show, :index]
  end
  resources :posts
  root 'static#home'
  get '/signup', to: 'users#new'
  post '/signup', to: 'users#create'
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  get '/auth/spotify/callback' => 'sessions#create'
  get '/posts/:id/repost' => 'posts#repost', as: 'repost'
  get '/users/:id/posts', to: 'users#posts_index'
end
