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

  get 'customers/my_page' => 'customers#show'
  patch 'customers/withdraw' => 'customers#withdraw'
  get 'customers/unsubscribe' => 'customers#unsubscribe'


  resources :addresses
  resources :cart_items
  resources :customers
  resources :items
  resources :orders


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
