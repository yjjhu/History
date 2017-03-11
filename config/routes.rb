Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'event_departments#index'
  get '/index',to: 'event_departments#index'
  get '/show',to:  'event_departments#show'
  get '/hh1',to:  'event_departments#hh1'
  get '/hh2',to:  'event_departments#hh2'

  resources :events, path: '/admin'
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  get '/logout', to: 'sessions#destroy'
end
