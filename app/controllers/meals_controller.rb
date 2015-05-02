class MealsController < ApplicationController
	def show
		@meals = current_user.meals
		@ingredients = readable_ingredients(@meals)
	end

	def new
		@banned_foods = current_user.banned_foods
		@allergies = Allergy.all
		@diets = Diet.all
    @cuisines = Cuisine.all
	end

	def create
		destroy_all_user_meals
 		@fave_num = params[:meal][:fave_num].to_i
 		@meal_num = params[:meal][:meal_num].to_i

 		@meals = Meal.make_meals(@meal_num, current_user)

 		redirect_to meal_plan_path
	end

	private
	
	def destroy_all_user_meals
		Meal.where(user_id: current_user.id).destroy_all
	end

	def readable_ingredients(meals)
		(meals.map do |meal| 
			meal.ingredients.map do |ingredient|
				ingredient.name
			end
		end).flatten.uniq.sort
	end
end