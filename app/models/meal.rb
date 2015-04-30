class Meal < ActiveRecord::Base
	belongs_to :user
	has_many :ingredients

	def self.service
		@service ||= MealService.new
	end

	def structify_meals
		service.meals["matches"].map do |match|
			OpenStruct.new(match)
		end
	end

	def meals_wanted(num)
		structify_meals.sample(num)
	end

	def make_meals(num)
		meals_wanted(num).map do |meal|
			new_meal = Meal.create(
		 		name: 			 meal.recipeName
		 		yummly_id: 	 meal.id
		    source_name: meal.sourceDisplayName	
		    image_url: 	 meal.imageUrlsBySize.values.firs
		    user_id: 		 current_user.id
				)
			meal.ingredients.map do |ing|
				Ingredient.find_or_create_by(name: ing, meal_id: new_meal.id)
			end
		end
	end

end