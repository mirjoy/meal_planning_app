class MealService 
	attr_reader :current_user, :connection, :meal_requirements

	def initialize(current_user)
		@current_user = current_user
		@meal_requirements = ""
		uri    = URI(URI.escape "http://api.yummly.com/v1/api/recipes?_app_id=#{ENV['yummly_id']}&_app_key=#{ENV['yummly_key']}&q=dinner&requirePictures=true&allowedCourse[]=course^course-Main-Dishes").to_s
		@connection = Faraday.new(url: uri)
	end

	def meals
		ban_foods
		# set_diets
		# set_allergies
		JSON.parse(connection.get('', @meal_requirements).body)		
	end

	def ban_foods
		@meal_requirements = { excludedIngredient: current_user.banned_foods.to_a }
		# current_user.banned_foods.each do |banned_food| 
		# 	@meal_requirements += "&excludedIngredient[]=#{banned_food.name}"
		# end
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

