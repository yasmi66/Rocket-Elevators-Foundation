Rails.application.routes.draw do
  if Rails.env.development?
    mount GraphiQL::Rails::Engine, at: "/graphiql", graphql_path: "/graphql"
  end
  post "/graphql", to: "graphql#execute"
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
  resources :interventions
  devise_for :users
  resources :users
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'

  get 'quotes/request_quote'
  post '/request_quote', to: 'quotes#create'


  get 'leads/leads_quote'
  post '/leads_quote', to: 'leads#create'

  # do not change root path for the mainPage, the home page is now called "mainPage"
  root "application#mainPage"

  get 'leads/leads_quote'
  post '/leads_quote', to: 'leads#create'

  get '/map', to: 'application#factElevator'
  # get '/map', to: 'application#google_map'

  get '/mainPage', to: "application#mainPage"
  get "/request_quote_page", to: "application#request_quote_page"
  get "/residential-services", to: "application#residential-services"

  #root path for Intervention service

  # get 'interventions/intervention_page'
  # post'/intervention_page\', to: 'interventions#create'

  # root to: redirect('/interventions')
  # get 'interventions', to: 'interventions#index', as: 'interventions'
  # get 'interventions/new', to: 'interventions#new', as: 'new_intervention'
  # get 'interventions/:id', to: 'interventions#show', as: 'intervention'
  # post '/interventions', to: 'interventions#create'
  


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
