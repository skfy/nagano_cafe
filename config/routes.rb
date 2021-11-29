Rails.application.routes.draw do

  devise_for :customers
  root to: 'homes#top'
  get 'home/about' => 'homes#about'

  namespace :admin do
    resources :customers
  end

  namespace :admin do
    resources :genres
  end

  namespace :admin do
    resources :items
  end

  namespace :admin do
    resources :order_details
  end

  namespace :admin do
    resources :orders
  end

  resources :addresses
  resources :cart_items
  resources :customers
  resources :items
  resources :orders

  get 'unsubscribe/:name' => 'homes#unsubscribe', as: 'confirm_unsubscribe'
  patch ':id/withdraw/:name' => 'homes#withdraw', as: 'withdraw_customer'
  put 'withdraw/:name' => 'customers#withdraw'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
