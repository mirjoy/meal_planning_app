require 'rails_helper'
require 'helpers'

RSpec.configure do |c|
  c.include Helpers
end

RSpec.describe "a user can choose what foods to ban", type: :feature do 
	it "can select allergies" do
		create(:allergy)
		user_visits_new_meal_path
		click_link_or_button('Add An Allergy')
		expect(page).to have_content("Dairy")
	end

	it "can add a certain diet" do
		create(:diet)
		user_visits_new_meal_path
		click_link_or_button('Add A Diet')
		expect(page).to have_content("Vegan")
	end

	xit "can exclude certain cuisines" do
		user_visits_new_meal_path
		expect(page).to have_content("Southwestern")
	# American, Italian, Asian, Mexican, Southern & Soul Food, French, Southwestern, Barbecue, Indian, Chinese, Cajun & Creole, English, Mediterranean, Greek, Spanish, German, Thai, Moroccan, Irish, Japanese, Cuban, Hawaiin, Swedish, Hungarian, Portugese
	end

	it "can type in a food and have it dynamically added to the banned list" do
		user_visits_new_meal_path
		fill_in "banned_food[name]", with: "Brussel sprouts"
		expect(page).to have_content("brussel sprouts")
	end

	def user_visits_new_meal_path
		user_logs_in
		visit new_meal_path
	end
end