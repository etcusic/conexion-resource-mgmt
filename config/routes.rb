Rails.application.routes.draw do
  resources :cards
  resources :decks
  root 'welcome#index'
  
end
