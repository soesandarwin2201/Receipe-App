Rails.application.routes.draw do
  devise_for :users
  root 'user#index'
  get 'public_recipes/index'
  resources :foods, only: [:index, :new, :create, :destroy]
  resources :recipes, only: [:index, :show, :new, :create, :destroy, :update] do 
    resources :food_recipes, only: [:new, :create, :edit, :update, :destroy]
  end
end
