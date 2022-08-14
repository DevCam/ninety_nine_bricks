Rails.application.routes.draw do
  resources :offers
  resources :realties, only: [ :index, :show ]

  resources :shopping_carts do
    get 'checkout', :on => :member
    get 'complete_purchase', :on => :member
    get 'accept_terms', :on => :member
  end

  resources :users

  root "realties#index"
end
