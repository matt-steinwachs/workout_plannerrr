Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :references
      resources :rounds
      resources :blocks
      resources :workouts
      resources :cycles
      resources :round_templates
      resources :block_templates
      resources :workout_templates
      resources :cycle_templates
      resources :exercises

      get "export", to: "admin#export"
      post "import", to: "admin#import"

      post "workout_templates/reorder", to: "workout_templates#reorder"
    end
  end
end
