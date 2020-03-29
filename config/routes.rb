Rails.application.routes.draw do
  resources :contacts do
    
    resource :kind, only: [:show]
    resource :kind, only: [:show], path: 'relationships/kind'

    resource :phones, only: [:show]
    resource :phones, only: [:show], path: 'relationships/phones'

    resource :address, only: [:show]
    resource :address, only: [:show], path: 'relationships/address'

  end
  resources :kinds
  # resources :phones
  # resources :addresses
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
