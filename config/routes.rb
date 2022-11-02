Rails.application.routes.draw do
<<<<<<< HEAD
=======
  resources :quotes
  resources :leads
  resources :employees
  resources :elevators
  resources :customers
  resources :columns
  resources :buildings
  resources :building_details
  resources :batteries
  resources :addresses
>>>>>>> a9daeb9eabffb946a230306c886bb8b5d262cff4
  devise_for :users
  resources :users
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  get 'quotes/request_quote'
  post '/request_quote', to: 'quotes#create'
  root "application#main-landing-page"

  get 'main-landing-page', to: "application#main-landing-page", as: 'main'
  get 'application/main-landing-page', to: "application#main-landing-page"
  get "/request-quote-page", to: "application#request-quote-page"
  get "/residential-services", to: "application#residential-services"


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
