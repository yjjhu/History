Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :events
  #resources :categories
  #resources :departments, only: [:create]
  #resources :departments
  #resources :event_departments, only: [:create]
end
