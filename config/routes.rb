Rails.application.routes.draw do
  root 'application#home'
 
  # resources should go under users once added
  resources :users
  resources :decks
  resources :cards
   
  get '/api/decks' => "api#decks"

end
