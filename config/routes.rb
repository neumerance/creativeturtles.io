Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  root "landing_pages#homepage"

  resources :products, only: [:index]
  resources :talents, only: [:index, :edit] do
    member do
      post :upload
    end
  end
  resources :recommendations, only: [:index]

  get "/products/:slug" => "products#show", as: :product
  get "/:handle" => "talents#show", as: :talent
end
