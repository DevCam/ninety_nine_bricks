Rails.application.routes.draw do
  resources :offers
  resources :realties, only: [:index, :show]
  resources :shopping_carts, only: [:index, :show]

  resources :users do
    resource :shopping_cart
  end


  # Defines the root path route ("/")
  root "realties#index"
end
