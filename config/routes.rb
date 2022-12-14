Rails.application.routes.draw do
  resources :trips do
    member do
      post 'toggle_favorite', to: "trips#toggle_favorite"
      get :copy
    end
    resources :stops
    resources :reviews, only: [:create]
  end
  devise_for :users
  root to: "pages#home"
  resources :reviews, only: [:edit, :destroy, :update]


# so we can have: domain.com/users/:id/favorites
  resources :users do
    resources :favorites, only: [:index]
  end

  resources :favorites, only: [:create, :destroy]

  resources :ratings, only: [:create, :destroy]

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
