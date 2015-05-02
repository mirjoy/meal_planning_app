class DietsController < ApplicationController
	def create
		@diet = Diet.find_by(name: params[:diet][:name])
		UserDiet.create(diet_id: @diet.id, user_id: current_user.id)
		redirect_to :back
	end

	def destroy
		UserDiet.find_by(diet_id: params[:id], user_id: current_user.id).destroy
	end
end