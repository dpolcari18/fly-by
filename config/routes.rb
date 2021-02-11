Rails.application.routes.draw do
  resources :employees
  resources :tickets
  resources :flights
  resources :airlines
  resources :passengers
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
