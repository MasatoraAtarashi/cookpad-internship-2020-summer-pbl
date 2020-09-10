Rails.application.routes.draw do
  resources :foods, only: %w[index show]
  resources :cart, only: %w[index create]
  delete "/cart", to: 'cart#destroy'
  root to: 'top#index'
end
