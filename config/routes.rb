Rails.application.routes.draw do
  resources :users
  root 'welcome#index'
  get '/api/decks' => "api#decks"
  
  # resources should go under users once added
  resources :decks
  resources :cards
  
end
