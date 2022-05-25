Rails.application.routes.draw do
  get 'reviews/new'
  devise_for :users
  root to: "pages#home"
  get 'dashboard', to: "pages#dashboard"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  resources :users do
    resources :friends, only: [:new, :create, :edit, :update]
  end
  resources :friends, only: [:index, :destroy, :show]
end
