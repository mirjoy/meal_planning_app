class MealService
	attr_reader :connection, :meal_requirements

	def initialize
		@meal_requirements = ""
		@connection = Faraday.new(url: "http://api.yummly.com/v1/api/recipes?_app_id=ENV["yummly_id"]&_app_key=ENV["yummly_key"]&q=dinner&requirePictures=true&allowedCourse[]=course^course-Main-Dishes")
	end

	def meals
		ban_foods
		# set_diets
		# set_allergies
		JSON.parse(connection.get(@meal_requirements).body)		
	end

	def ban_foods
		current_user.banned_foods.each do |banned_food| 
			@meal_requirements += "&excludedIngredient[]=#{banned_food}"
		end
	end

	def set_diets
		current_user.diets.each do |diet| 
			@meal_requirements += #"&excludedIngredient[]=#{banned_food}"
		end
	end

	def set_allergies
		current_user.allergies.each do |allergy| 
			@meal_requirements += #"&excludedIngredient[]=#{banned_food}"
		end
	end
end

