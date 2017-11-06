Rails.application.routes.draw do
  root 'store#index', as: :store_index

  resources :products do
    get 'who_bought', on: :member
  end
  resources :line_items, only: [:new, :create]
  resources :carts, only: [:show, :destroy]
  resources :orders, only: [:show, :new, :create]
end