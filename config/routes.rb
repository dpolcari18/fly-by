Rails.application.routes.draw do
  resources :employees, only: [:show]
  resources :tickets, only: [:show, :destroy, :new, :create, :edit, :update]
  resources :flights, only: [:index]
  resources :airlines, only: [:show]
  resources :passengers, only: [:show, :new, :create, :index]
  get 'logout' => 'sessions#destroy'
  resource :sessions, only: [:new, :create]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'welcomes#home'
end
