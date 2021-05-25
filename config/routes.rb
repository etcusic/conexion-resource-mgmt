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
  resources :wait_time, only: [:index, :create]
   
  get '/api/decks' => "api#decks"

end
