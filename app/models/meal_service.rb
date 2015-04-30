class MealService 
	attr_reader :current_user, :connection, :meal_requirements

	def initialize(current_user)
		@current_user			 = current_user
		uri   						 = URI(URI.escape "http://api.yummly.com/v1/api/recipes?_app_id=#{ENV['yummly_id']}&_app_key=#{ENV['yummly_key']}").to_s
		@connection 			 = Faraday.new(url: uri)
	end

	def meals
		api_req = connection.get do |req|
			req.params['q'] = 'dinner'
			req.params['requirePictures'] = true
			req.params['allowedCourse'] = "course^course-Main-Dishes"
			req.params["excludedIngredient[]=#"] = ban_foods
		end

		JSON.parse(api_req.body).to_s
	end

	def ban_foods
		current_user.banned_foods.map {|food| food.name }
	end

	def set_diets
		current_user.diets.each do |diet| 
			@meal_requirements += "&excludedIngredient[]=#{banned_food.name}"
		end
	end

	def set_allergies
		current_user.allergies.each do |allergy| 
			@meal_requirements += "&excludedIngredient[]=#{banned_food.name}"
		end
	end
end

