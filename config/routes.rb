Rails.application.routes.draw do
  root "articles#main-landing-page"

  get "/main-landing-page", to: "articles#main-landing-page"
  get "/buisness-services", to: "articles#buisness-services"
  get "/request-quote-page", to: "articles#request-quote-page"
  get "/residential-services", to: "articles#residential-services"

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
