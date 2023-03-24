Rails.application.routes.draw do
  devise_for :users
  root 'user#index'
  get 'public_recipes/index'
  resources :foods, only: [:index, :new, :create, :destroy]

  # Defines the root path route ("/")
  # get "food#index"
  resources :recipes, only: [:index, :show, :new, :create, :destroy, :update] do 
    resources :food_recipes, only: [:new, :create, :edit, :update, :destroy]
  end
end
