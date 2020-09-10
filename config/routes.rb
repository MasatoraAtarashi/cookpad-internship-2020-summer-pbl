Rails.application.routes.draw do
  resources :foods, only: %w[index show]
  resources :cart, only: %w[index create]
  root to: 'top#index'
end
