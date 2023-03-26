Rails.application.routes.draw do
  get 'shopping_list/index'
  devise_for :users
  root 'user#index'
  get 'public_recipes/index'
  get 'shopping_list/index'
  resources :foods, only: [:index, :new, :create, :destroy]
  # resources :shopping_lists, only: [:index]

  # Defines the root path route ("/")
  # get "food#index"
  resources :recipes, only: [:index, :show, :new, :create, :destroy, :update] do 
    resources :food_recipes, only: [:new, :create, :edit, :update, :destroy]
  end
end
