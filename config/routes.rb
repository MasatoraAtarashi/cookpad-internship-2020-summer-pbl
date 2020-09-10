Rails.application.routes.draw do
  resources :foods, only: %w[index show]
  root to: 'top#index'
end
