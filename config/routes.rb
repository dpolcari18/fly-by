Rails.application.routes.draw do
  resources :employees
  resources :tickets, only: [:show]
  resources :flights, only: [:index, :show]
  resources :airlines
  resources :passengers, only: [:show]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
