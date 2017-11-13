Rails.application.routes.draw do
  get 'admin', to: 'admin#index'
  controller :sessions do
    get 'login' => :new
    post 'login' => :create
    delete 'logout' => :destroy
  end

  resources :users, except: :show
  resources :products do
    get 'who_bought', on: :member
  end

  scope '(:locale)' do
    resources :line_items, only: [:new, :create]
    resources :carts, only: [:show, :destroy]
    resources :orders, only: [:index, :show, :new, :create]
    root 'store#index', as: :store_index, via: :all
  end
end