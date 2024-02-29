Rails.application.routes.draw do
  
    resources :users do
      resources :workouts
    end
    resources :workouts
  end
