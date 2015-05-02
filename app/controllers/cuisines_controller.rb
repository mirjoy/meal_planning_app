class CuisinesController < ApplicationController
	def create
		@cuisine = Cuisine.find_by(name: params[:cuisine][:name])
		UserCuisine.create(cuisine_id: @cuisine.id, user_id: current_user.id)
		redirect_to :back
	end

	def destroy
		UserCuisine.find_by(cuisine_id: params[:id], user_id: current_user.id).destroy
	end
end