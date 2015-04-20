Rails.application.routes.draw do
  root to: "home#index"

  get "/meal-plan" => "meals#show"
  
  resources :meals
  resources :users
  resources :home, only: :index
end
