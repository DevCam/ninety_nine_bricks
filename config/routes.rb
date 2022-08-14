Rails.application.routes.draw do
  resources :offers
  resources :realties, only: [:index, :show]
  resources :shopping_carts do
    get 'checkout', :on => :member
  end
  resources :users

  # Defines the root path route ("/")
  root "realties#index"
end
