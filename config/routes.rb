Rails.application.routes.draw do
  root "posts#index"

  resources :posts
  get "/category/:name" => "posts#category", as: "post_category"

  get "search", to: "posts#search"

  get "/login" => "sessions#new"
  post "/login" => "sessions#create"
  get "/logout" => "sessions#destroy"

  get "/signup" => "users#new", as: "signup"
  post "/users" => "users#create"

  get "/profile/:name" => "users#show", as: "profile"

  get "/cart" => "carts#index"

  get "/dashboard" => "dashboard#index", as: "dashboard"
  get "/dashboard/downloads" => "dashboard#downloads", as: "dashboard_downloads"
  get "/dashboard/earnings" => "dashboard#earnings", as: "dashboard_earnings"
  get "/dashboard/projects" => "dashboard#projects", as: "dashboard_projects"

  resources :cart_posts
  resources :charges
  resources :orders
end
