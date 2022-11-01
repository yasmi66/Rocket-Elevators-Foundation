Rails.application.routes.draw do
  resources :tests
  devise_for :users
  resources :users
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  get 'quotes/request_quote'
  post '/request_quote', to: 'quotes#create'
  root "application#mainPage"

  get 'mainPage', to: "application#main"
  get "/request-quote-page", to: "application#request-quote-page"
  get "/residential-services", to: "application#residential-services"


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
