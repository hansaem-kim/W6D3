Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  # resources :users

  # get 'users', to: 'users#index'
  # get 'users/:id', to: 'users#show', as: 'user'
  # post 'users', to:'users#create'
  # patch 'users/:id', to: 'users#update'
  # put 'users/:id', to: 'users#update'
  # delete 'users/:id', to: 'users#destroy'

  resources :users, only: [:index, :show, :create, :update, :destroy]

  resources :artworks, only: [:index, :show, :create, :update, :destroy]

  resources :artwork_shares, only: [:create, :destroy]

  resources :users do 
    resources :artworks 
  end

end
