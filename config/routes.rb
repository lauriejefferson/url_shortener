Rails.application.routes.draw do
  resources :url_links
  resources :views, path: :v, only: [:show]
  root "url_links#index"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
