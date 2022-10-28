Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  get 'quotes/request_quote'
  post '/request_quote', to: 'quotes#create'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
