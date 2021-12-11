Rails.application.routes.draw do

  devise_for :admin, controllers: {
  sessions: 'admin/sessions'
  }

  namespace :admin do
    get 'home/admin' => 'homes#admin'
    resources :customers
    resources :genres
    resources :items
    resources :order_details
    resources :orders
  end



  devise_for :customers
  root to: 'homes#top'
  get 'home/about' => 'homes#about'
  get 'customers/my_page' => 'customers#show'
  patch 'customers/withdraw' => 'customers#withdraw'
  get 'customers/unsubscribe' => 'customers#unsubscribe'

  resources :addresses
  resources :cart_items
  resources :customers
  resources :orders

  resources :items do
    #get 'items' => 'index'
    get 'order' => 'orders#show'
    post 'order/confirm' => 'orders#confirm'
    post 'order' => 'orders#create'
  end


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end