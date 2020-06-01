Rails.application.routes.draw do
  get "/planets", to:'planets#index'
  post "/planets", to:'planets#create'
  get "/planets/:id", to:'planets#show'
  get "planets/name/:name", to: 'planets#consult_name'
  delete "planets/:id", to: 'planets#destroy' 
end
