Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :check_ins, only: [:index, :show, :new, :create, :destroy]

  get "/sign_up", to: "users#new"

  resources :users, only: [:create]
end
