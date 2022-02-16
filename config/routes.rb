Rails.application.routes.draw do


  # resources :orders
  root to: 'orders#index'
 
  get '/products', :to => 'products#index'
  get '/new_order', to: 'orders#new', as: 'new_order_path'
  get '/new_shipping', to: 'shippings#new', as: 'new_shipping_path'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

