Rails.application.routes.draw do


   devise_for :admins,
    path: :admin,

    controllers: {
      registrations: "admin/registrations",
      sessions: "admin/sessions"
    }

  #devise_for :admin

  get '/admin' => 'admin/homes#top'

  namespace :admin do
    resources :customers
    resources :genres
    resources :items
    resources :order_details
    resources :orders
  end


  scope module: :public do
   devise_for :customers
   root to: 'homes#top'
   get 'home/about' => 'homes#about'
   get 'customers/my_page' => 'customers#show'
   patch 'customers/withdraw' => 'customers#withdraw'
   get 'customers/unsubscribe' => 'customers#unsubscribe'


   post 'orders/confirm' => 'orders#confirm'
   get 'orders/complete' => 'orders#complete'
   resources :addresses
   delete 'cart_items/destroy_all' => 'cart_items#destroy_all', as: 'destroy_all'
   resources :cart_items
   resources :customers
   resources :orders
   resources :items
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end