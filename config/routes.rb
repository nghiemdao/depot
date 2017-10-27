Rails.application.routes.draw do
  root 'store#index', as: :store_index

  resources :products
  resources :line_items, only: [:new, :create]
  resources :carts, only: :show
end
