Rails.application.routes.draw do
  resources :trips do
    resources :stops, only: [:update, :create, :destroy, :new]
  end
  devise_for :users
  root to: "pages#home"

# so we can have: domain.com/users/:id/favorites
  # resources :users do
  #   resources :favorites, only: [:index]
  # end

  resources :favorites, only: [:create, :destroy]

  resources :ratings, only: [:create, :destroy]

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
