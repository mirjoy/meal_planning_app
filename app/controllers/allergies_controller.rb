class AllergiesController < ApplicationController
	def create
    @allergy = Allergy.find_by(name: params[:allergy][:name])
		UserAllergy.create(allergy_id: @allergy.id, user_id: current_user.id)
		redirect_to :back
	end

	def destroy
		UserAllergy.find_by(allergy_id: params[:id], user_id: current_user.id).destroy
	end
end