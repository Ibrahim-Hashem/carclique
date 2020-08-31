Rails.application.routes.draw do
  get 'transactions/create'
  get 'transactions/update'
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  resources :users
  resources :cars do
    resources :transactions, only: [:create]
    member do
      patch :accept_bid
    end
  end
end
