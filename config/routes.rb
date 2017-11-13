Rails.application.routes.draw do
  get 'admin', to: 'admin#index'

  controller :sessions do
    get 'login' => :new
    post 'login' => :create
    delete 'logout' => :destroy
  end
  
  root 'store#index', as: :store_index

  resources :products do
    get 'who_bought', on: :member
  end
  resources :line_items, only: [:new, :create]
  resources :carts, only: [:show, :destroy]
  resources :orders, only: [:index, :show, :new, :create]
  resources :users, except: :show
end