Rails.application.routes.draw do
  root "posts#index"

  resources :posts
  get "/category/:name" => "posts#category", as: "post_category"

  get "/login" => "sessions#new"
  post "/login" => "sessions#create"
  get "/logout" => "sessions#destroy"

  get "/signup" => "users#new", as: "signup"
  post "/users" => "users#create"

  get "/profile/:name" => "users#show", as: "profile"

  get "/cart" => "carts#index"

  get "/dashboard" => "dashboard#index", as: "dashboard"
  get "/dashboard/downloads", as: "dashboard_downloads"
  get "/dashboard/earnings", as: "dashboard_earnings"
  get "/dashboard/projects", as: "dashboard_projects"

  get "/admin" => "admin#index", as: "admin"
  get "/admin/users", as: "admin_users"
  get "/admin/orders", as: "admin_orders"
  get "/admin/posts", as: "admin_posts"

  resources :cart_posts
  resources :charges
  resources :orders
end
