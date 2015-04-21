Rails.application.routes.draw do
  root to: "home#index"

  get "/meal-plan" => "meals#show"
  get 'auth/:provider/callback', to: 'sessions#create'
  get '/auth/failure' do
	  flash[:notice] = params[:message]
	  redirect '/'
	end

	get 'logout', to: 'sessions#destroy'
  
  resources :meals, except: :show
  resources :users
  resources :home, only: :index
end
