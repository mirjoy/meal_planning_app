require 'rails_helper'
require 'helpers'

RSpec.configure do |c|
  c.include Helpers
end

RSpec.describe "user tries to create meal plan", type: :feature do 
	it "successfully creates a meal plan" do
		user_logs_in
		visit new_meal_path
		click_link_or_button("Get Your Meal Plan")
		binding.pry

		expect(current_path).to eq(meal_plan_path)
	end
end