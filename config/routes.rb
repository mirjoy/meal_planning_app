Rails.application.routes.draw do
  root to: "home#index"

  match "auth/:provider/callback", to: "sessions#create", via: :all
  post   "/login",                 to: "sessions#create"
  match "logout", to: "sessions#destroy", via: :all
  match "/auth/failure", via: :all do
    flash[:notice] = params[:message]
    redirect "/"
  end

  
  get "/meal-plan" => "meals#show"
  get "/account" => "users#show"
  get "/login" => "sessions#new"

  resources :sessions,         except: [:create, :destroy, :new]
  resources :meals,            except: :show
  resources :users,            except: :show
  resources :home,             only: :index
  resources :favorites,        only: :index
  resources :password_resets,  only: [:new, :create, :edit, :update]
end
