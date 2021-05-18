Rails.application.routes.draw do
  root 'welcome#index'
  get '/api_decks' => "api#decks"
  resources :decks
  resources :cards
  
end
