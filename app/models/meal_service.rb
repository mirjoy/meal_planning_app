class MealService
	attr_reader :connection
	attr_accessor :meal_requirements

	def initialize
		@meal_requirements = ""
		@connection = Faraday.new(url: "http://api.yummly.com/v1/api/recipes?_app_id=yummly_id&_app_key=yummly_key&q=dinner&requirePictures=true")
	end

	def meals
		JSON.parse(connection.get(@meal_requirements).body)		
	end
end

