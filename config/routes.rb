Rails.application.routes.draw do
  get 'transactions/create'
  get 'transactions/update'
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :cars, only: [:show] do
    resources :transactions, only: [:create]
  end
end
