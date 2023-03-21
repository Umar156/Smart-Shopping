Rails.application.routes.draw do
  get "terms_condition" , to: "terms_and_condition#index"
  devise_for :users
  root 'homes#index'
  resources:users
  
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
