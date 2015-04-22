Rails.application.routes.draw do
  root to: "home#index"

  match "auth/:provider/callback", to: "sessions#create", via: :all
  match "signout", to: "sessions#destroy", via: :all
  match "/auth/failure", via: :all do
    flash[:notice] = params[:message]
    redirect "/"
  end

  
  get "/meal-plan" => "meals#show"
  get "/account" => "users#show"

  resources :sessions, except: [:create, :destroy]
  resources :meals, except: :show
  resources :users, except: :show
  resources :home, only: :index
  resources :favorites, only: :index
end
