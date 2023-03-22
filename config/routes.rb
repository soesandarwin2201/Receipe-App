Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  devise_for :users
  

  resources :foods, only: [:index, :new, :create, :show, :destroy]

  # Defines the root path route ("/")
  # get "food#index"
  resources :recipes, only: [:index, :new, :show, :create, :destroy]
end
