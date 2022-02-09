Rails.application.routes.draw do
  get '/zoos', to: 'zoos#index'
  get '/zoos/new', to: 'zoos#new'
  get '/zoos/:id', to: 'zoos#show'
  get '/exhibits', to: 'exhibits#index'
  get '/exhibits/:id', to: 'exhibits#show'
  post '/zoos', to: 'zoos#create'
end
