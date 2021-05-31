Rails.application.routes.draw do
  get 'visitors/index'
  root 'application#home'

  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  post '/logout' => 'sessions#destroy'
  post '/visitor_login' => 'sessions#visitor_login'
 
  # resources should go under users once added
  resources :users do 
    resources :decks 
  end
  resources :decks, only: [:index]  #=> adjust what deck paths anyone can see
  resources :visitors, only: [:index]
  resources :errors, only: [:index]
   
  get '/api/decks' => "api#decks"

end
