Rails.application.routes.draw do
  root 'application#home'

  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  post '/logout' => 'sessions#destroy'
  get '/auth/facebook/callback' => 'sessions#create_with_omniauth'
 
  # resources should go under users once added
  resources :users
  resources :decks
  resources :cards
   
  get '/api/decks' => "api#decks"

end
