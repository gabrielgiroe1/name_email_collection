Rails.application.routes.draw do
  get "subscribers/new"
  get "subscribers/thank_you"
  get "subscribers/create"
  get "up" => "rails/health#show", as: :rails_health_check
  root "subscribers#new"

  resources :subscribers, only: [:create]
  get "thank_you" => "subscribers#thank_you", as: :thank_you
end
