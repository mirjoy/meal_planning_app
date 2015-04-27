class BannedFoodsController < ApplicationController
	def create
		@new_food = BannedFood.find_or_create_by(food_params)
		if @new_food.save
			current_user.banned_foods << @new_food
			flash[:alert] = "You will no longer get recipes that include #{@new_food.name.pluralize}" 
			redirect_to :back
		else
			flash[:error] = "Something went wrong. Please try again."
			redirect_to :back
		end
	 end

	def destroy
		@food_to_remove = BannedFood.find_by(name: params[:banned_food][:food_name])
		if UserBannedFood.find_by(user_id: current_user.id, 
													 banned_food_id: @food_to_remove.id).destroy
			flash[:error] = "#{@food_to_remove.name} will now be included in your recipes"
			redirect_to :back
		else
			flash[:error] = "Something went wrong. Please try again."
			redirect_to :back
		end
	end

	private
	 def food_params
      params.require(:banned_food).permit(:name)
   end
end