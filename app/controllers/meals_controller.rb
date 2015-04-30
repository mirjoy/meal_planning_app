class MealsController < ApplicationController
	def show
	end

	def new
		@banned_foods = current_user.banned_foods
		@allergies = Allergy.all
		@diets = Diet.all
    @cuisines = Cuisine.all
	end

	def create
 		@fave_num = params[:meal][:fave_num].to_i
 		@meal_num = params[:meal][:meal_num].to_i

 		@meals = Meal.make_meals(@meal_num)

 		redirect_to meal_plan_path
	end
end