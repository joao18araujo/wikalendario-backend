Rails.application.routes.draw do
  resources :campi, only: %i[show index]
  resources :universities, only: %i[show index]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
