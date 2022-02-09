Rails.application.routes.draw do
  get '/zoos', to: 'zoos#index'
  get '/zoos/new', to: 'zoos#new'
  get '/zoos/:id', to: 'zoos#show'
  get '/exhibits', to: 'exhibits#index'
  get '/exhibits/:id', to: 'exhibits#show'
  get '/zoos/:zoo_id/exhibits', to: 'zoo_exhibits#index'
  post '/zoos', to: 'zoos#create'
  get '/zoos/:id/edit', to: 'zoos#edit'
  patch '/zoos/:id', to: 'zoos#update'
  get '/exhibits/:id/edit', to: 'exhibits#edit'
  patch '/exhibits/:id', to: 'exhibits#update'
end
