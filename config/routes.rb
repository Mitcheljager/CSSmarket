Rails.application.routes.draw do
  root to: 'high_voltage/pages#show', id: 'home'

  resources :posts
  get 'search', to: 'posts#search'
end
