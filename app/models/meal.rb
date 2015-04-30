class Meal < ActiveRecord::Base
	belongs_to :user
	has_many :ingredients

	attr_reader :current_user

	def self.service
		@service ||= MealService.new(@current_user)
	end

	def self.structify_meals
		service.meals["matches"].map do |match|
			OpenStruct.new(match)
		end
	end

	def self.meals_wanted(num)
		structify_meals.sample(num)
	end

	def self.make_meals(num, current_user)
		@current_user = current_user

		meals_wanted(num).map do |meal|
			new_meal = Meal.create(
		 		name: 			 meal.recipeName,
		 		yummly_id: 	 meal.id,
		    source_name: meal.sourceDisplayName,
		    image_url: 	 meal.imageUrlsBySize.values.first,
		    user_id: 		 current_user.id
				)
			meal.ingredients.map do |ing|
				Ingredient.create(name: ing, meal_id: new_meal.id)
			end
		end
	end
end