Rails.application.routes.draw do
  resources :employees
  resources :tickets, only: [:show, :destroy, :edit, :update]
  resources :flights, only: [:index, :show]
  resources :airlines
  resources :passengers, only: [:show, :new, :create]
  get 'logout' => 'sessions#destroy'
  resource :sessions, only: [:new, :create]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'welcomes#home'
end
