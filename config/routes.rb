Rails.application.routes.draw do
  get "cart" , to: 'cart#show'
  post 'cart/add'
  post 'cart/remove'
  get 'vendors/index'
  get 'admins/index'
  get "terms_condition" , to: "terms_and_condition#index"
  devise_for :users
  root 'homes#index'
  get "checkout" , to: 'checkout#new'
  get "category" , to: 'products#index'
  get "jazzcash" , to: 'checkout#jazzcash'
  get "easypaisa" , to: 'checkout#easypaisa'
  get "mastercard" , to: 'checkout#mastercard'
  resources:users
  resources:products
  resources:checkout
  resources:category
  get '/category/:id/products', to: 'category#cat_products', as: 'category_products' 
  
  


  
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
