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
		
	end
end