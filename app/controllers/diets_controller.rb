class DietsController < ApplicationController
	def create
		@diet = Diet.find_by(name: params[:diet][:name])
		UserDiet.create(diet_id: @diet.id, user_id: current_user.id)
		redirect_to :back
	end

	def destroy
		@diet_to_remove = BannedFood.find_by(id: params[:id])
		UserBannedFood.find_by(user_id: 			 current_user.id, 
													 banned_food_id: @diet_to_remove.id).destroy
		render :new
	end
end