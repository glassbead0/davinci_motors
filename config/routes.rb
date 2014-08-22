Rails.application.routes.draw do
  root 'cars#index'

  resources :cars
  resources :users,
    only: [:new, :create],
    path_names: { new: 'signup' }

  get '/login' => 'sessions#login', as: 'login'
  post '/login' => 'sessions#create'

  delete '/logout' => 'sessions#destroy'

  get '/auth/:provider/callback' => 'sessions#oauth'

end
