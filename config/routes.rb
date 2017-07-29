Rails.application.routes.draw do
  root "posts#index"

  resources :posts

  get "search", to: "posts#search"

  get "/login" => "sessions#new"
  post "/login" => "sessions#create"
  get "/logout" => "sessions#destroy"

  get "/signup" => "users#new"
  post "/users" => "users#create"

  get "/profile/:name" => "users#show"

  get "/cart" => "carts#index"

  get "/dashboard" => "dashboard#index", :as => "dashboard"
  get "/dashboard/downloads" => "dashboard#downloads", :as => "dashboard_downloads"

  resources :cart_posts
  resources :charges
  resources :orders
end
