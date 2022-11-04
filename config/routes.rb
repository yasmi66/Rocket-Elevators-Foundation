Rails.application.routes.draw do
  devise_for :users
  resources :users
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  get 'quotes/request_quote'
  post '/request_quote', to: 'quotes#create'

  get 'leads/leads_quote'
  post '/leads_quote', to: 'leads#create'

  root "application#main-landing-page"

  get 'main-landing-page', to: "application#main-landing-page", as: 'main'
  get 'application/main-landing-page', to: "application#main-landing-page"
  get "/request-quote-page", to: "application#request-quote-page"
  get "/residential-services", to: "application#residential-services"


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
