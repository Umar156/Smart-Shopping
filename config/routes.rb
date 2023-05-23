Rails.application.routes.draw do
  get "cart" , to: 'cart#show'
  post 'cart/add'
  post 'cart/remove'
  get 'vendors/index'
  get 'admins/index'
  # get 'products/index'
  get "terms_condition" , to: "terms_and_condition#index"
  devise_for :users
  root 'homes#index'
  resources:users
  resources:products
  

  
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
