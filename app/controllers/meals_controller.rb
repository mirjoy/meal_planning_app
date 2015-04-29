class MealsController < ApplicationController
	def self.service
		@service ||= MealService.new
	end

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