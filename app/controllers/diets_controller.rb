class DietsController < ApplicationController
	def create
		@diet = Diet.find_or_create_by(name: params[:diet])
		current_user.diets << @diet
	end

	def destroy
		@diet_to_remove = BannedFood.find_by(id: params[:id])
		UserBannedFood.find_by(user_id: 			 current_user.id, 
													 banned_food_id: @diet_to_remove.id).destroy
	end
end