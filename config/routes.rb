Rails.application.routes.draw do
  get 'admin/index'
  get 'sessions/new'
  get 'sessions/create'
  get 'sessions/destroy'
  get 'access/new', as: 'check'
    
    
  get 'access/create'
    post 'access/create', as: 'login'
  get 'access/destroy'
    delete 'access/destroy', as: 'logout'
  get 'admin/index', as: 'admin'
  resources :users
  resources :orders
  resources :lineitems
  resources :carts
  get 'shopper/index', as: 'shopper'
  resources :products
  root "shopper#index", as: 'root'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
