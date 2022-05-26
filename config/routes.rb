Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"
  get 'dashboard', to: "pages#dashboard"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  resources :friends, only: [:index, :destroy, :show, :create, :new, :edit, :update] do
    resources :bookings, only: [:create]
  end
  resources :bookings, only: [] do
    resources :reviews, only: [:new, :create]
  end
end
