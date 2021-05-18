Rails.application.routes.draw do
  root 'welcome#index'
  resources :decks
  resources :cards
  
end
