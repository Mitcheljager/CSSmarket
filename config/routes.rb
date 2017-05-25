Rails.application.routes.draw do
  root to: "posts#index"

  resources :posts
  get 'search', to: 'posts#search'
end
