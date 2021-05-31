Rails.application.routes.draw do
  root 'application#home'

  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  post '/logout' => 'sessions#destroy'
 
  # resources should go under users once added
  resources :users do 
    resources :decks 
  end
  resources :decks, only: [:index]
  resources :errors, only: [:index]
   
  get '/api/decks' => "api#decks"

end
