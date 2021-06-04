Rails.application.routes.draw do

  root 'application#home'

  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  post '/logout' => 'sessions#destroy'
 
  # resources should go under users once added
  resources :users do 
    resources :decks 
  end

  get '/deck_search' => "deck_searches#show"
  resources :decks #=> should any be excluded? - maybe :new?

  resources :visitors, only: [:index]
  resources :errors, only: [:index]
   
  get '/api/decks' => "api#decks"

end
