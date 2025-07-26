Rails.application.routes.draw do
  get "players/index"
  get "players/show"
  get "matchups/index"
  get "matchups/show"
  # Root route
  root "home#index"
  
  # Newsletter routes
  resources :weekly_newsletters, only: [:index, :show]
  
  # Team routes
  resources :teams, only: [:index, :show]
  
  # Matchup routes
  resources :matchups, only: [:index, :show]
  
  # Player routes
  resources :players, only: [:index, :show]
  
  # League dashboard
  get "dashboard", to: "home#dashboard"
  
  # About page
  get "about", to: "home#about"

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Render dynamic PWA files from app/views/pwa/* (remember to link manifest in application.html.erb)
  get "manifest" => "rails/pwa#manifest", as: :pwa_manifest
  get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker
end
