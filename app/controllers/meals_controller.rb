class MealsController < ApplicationController
	def show
	end

	def new
		@banned_foods = current_user.banned_foods
		@allergies = Allergy.all
		@diets = Diet.all
	
		# yummly allergies = %w(Dairy Egg Gluten Peanut Seafood Sesame Soy Sulfite Tree Nut Wheat)
		# yummly diets = %w(Lacto-vegetarian Ovo-vegetarian Pescetarian Vegan Vegetarian)
	end
end