Rails.application.routes.draw do
  root 'application#home'

  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  post '/logout' => 'sessions#destroy'
 
  # resources should go under users once added
  resources :users do 
    resources :decks do 
      resources :cards
    end
  end
  resources :decks, only: [:index]
  resources :cards, only: [:index]
   
  get '/api/decks' => "api#decks"

  get '/errors/invalid_user' => "errors#invalid_user"
end
