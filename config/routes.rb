Rails.application.routes.draw do
  root 'application#home'

  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  post '/logout' => 'sessions#destroy'
 
  # resources should go under users once added
  resources :users
  resources :decks
  resources :cards
  resources :wait_time, only: [:index, :create]
   
  get '/api/decks' => "api#decks"

end
