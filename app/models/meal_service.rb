class MealService
	attr_reader :connection

	def initialize
		@connection = Faraday.new(url: "http://api.yummly.com/v1/api/recipes?_app_id=yummly_id&_app_key=yummly_key&q=dinner&requirePictures=true")
	end

	def meals(meal_requirements)
		JSON.parse(connection.get(meal_requirements).body)		
	end
end

