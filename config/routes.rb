Rails.application.routes.draw do
  get "up" => "rails/health#show", as: :rails_health_check

  root "subscribers#new"

  resources :subscribers, only: [ :new, :create ]
  get "thank_you" => "subscribers#thank_you", as: :thank_you
end
