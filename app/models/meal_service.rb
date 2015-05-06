class MealService 
	attr_reader :current_user, :connection, :meal_requirements

	def initialize(current_user)
		@current_user			 = current_user
		@connection 			 = Faraday.new(url: "http://api.yummly.com/v1/api/recipes?_app_id=#{ENV['yummly_id']}&_app_key=#{ENV['yummly_key']}")
	end

	def meals
		api_req = connection.get do |req|
			req.params['q='] = 'main'
			req.params['requirePictures='] = true
			req.params['allowedCourse[]=course'] = "^course-Main-Dishes"
			req.params["excludedIngredient[]="] = ban_foods
			req.params["excludedCuisine[]=cuisine^cuisine-"] = ban_cuisines
			req.params["allowedAllergy[]="] = set_allergies

			# req.params[] = set_diets
		end
		JSON.parse(api_req.body)
	end

	def ban_foods
		current_user.banned_foods.map { |food| food.name.gsub(" ", "%20") }
	end

	def ban_cuisines
		current_user.cuisines.map { |cuisine| cuisine.name.gsub(" ", "-") }		
	end

	def set_diets
		current_user.diets { |diet| diet.meta_value }
	end

	def set_allergies
		current_user.allergies { |allergy| allergy.meta_value }
	end
end

