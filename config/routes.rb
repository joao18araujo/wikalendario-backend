Rails.application.routes.draw do
  resources :subjects, only: %i[show]
  resources :departments, only: %i[show]
  resources :campi, only: %i[show]
  resources :universities, only: %i[show index]

  api_guard_routes for: 'users', controller: {
    registration: 'users/registration',
  }
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
