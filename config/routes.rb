Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  devise_for :users
  resources :foods, only: [:index, :new, :create]

  # Defines the root path route ("/")
end
