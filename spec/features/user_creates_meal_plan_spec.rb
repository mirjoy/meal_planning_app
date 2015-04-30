require 'rails_helper'

RSpec.describe "user tries to create meal plan", type: :feature do 
	it "successfully creates a meal plan" do
		user_logs_in
		visit new_meal_path
		click_link_or_button("Get Your Meal Plan")
	end
end