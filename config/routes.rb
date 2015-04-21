Rails.application.routes.draw do
  root to: "home#index"

  get "auth/:provider/callback", to: "sessions#create", via: :all
  match "signout", to: "sessions#destroy", via: :all
  match "/auth/failure", via: :all do
    flash[:notice] = params[:message]
    redirect "/"
  end

  
  get "/meal-plan" => "meals#show"

  resources :meals, except: :show
  resources :users
  resources :home, only: :index
end
