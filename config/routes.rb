Rails.application.routes.draw do
  root 'posts#index'

  resources :posts

  get 'search', to: 'posts#search'

  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  get '/logout' => 'sessions#destroy'

  get '/signup' => 'users#new'
  post '/users' => 'users#create'

  get '/profile/:name' => 'users#show'

  get '/cart' => 'carts#index'

  resources :cart_posts
  resources :charges
  resources :orders
end
