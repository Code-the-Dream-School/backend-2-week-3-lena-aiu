Rails.application.routes.draw do
  root to: 'customer#index'
  resources :customers
  resources :orders
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
