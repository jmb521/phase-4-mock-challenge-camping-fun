Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  resources :campers, only: [:create, :show, :index]
  resources :activities, only: [:index, :destroy]
  
  post "/signups", to: "signup#create"
end
