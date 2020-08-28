Rails.application.routes.draw do
  resources :users, :sessions, :events, :attendees
  
  root "sessions#new"
end
