require 'URI'

class MealService 
	attr_reader :current_user, :connection, :meal_requirements

	def initialize(current_user)
		@current_user = current_user
		@connection 	= Faraday.new(url: "http://api.yummly.com/v1/api/recipes?_app_id=#{ENV['yummly_id']}&_app_key=#{ENV['yummly_key']}")
	end

	def meals
		api_req = connection.get do |req|
			req.params['q'] = 'main'
			req.params['requirePictures'] = true
			req.params['allowedCourse'] = "course^course-Main-Dishes"
			req.params['excludedCourse'] = "course^course-Appetizers"
			req.params['excludedCourse'] = "course^course-Beverages"
			req.params['excludedCourse'] = "course^course-Condiments%20and%20Sauces"
			req.params['excludedIngredient'] = ban_foods
			req.params['excludedCuisine'] = ban_cuisines
			req.params['allowedAllergy'] = set_allergies
			req.params['allowedDiet'] = set_diets
		end
		binding.pry
		JSON.parse(api_req.body)
	end

	def ban_foods
		current_user.banned_foods.map { |food| food.name.gsub(" ", "%20") }
	end

	def ban_cuisines
		current_user.cuisines.map { |cuisine| "cuisine^cuisine-" + cuisine.name.gsub(" ", "-") }		
	end

	def set_diets
		current_user.diets.map { |diet| diet.meta_value }
	end

	def set_allergies
		current_user.allergies.map { |allergy| allergy.meta_value }
	end
end

