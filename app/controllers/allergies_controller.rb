class AllergiesController < ApplicationController
	def create
		@allergy = Allergy.find_by(name: params[:name])
		UserAllergy.create(allergy_id: @allergy.id, user_id: current_user.id)
	end

	def destroy
		UserAllergy.find_by(name: params[:name], user_id: current_user.id).destroy
	end
end