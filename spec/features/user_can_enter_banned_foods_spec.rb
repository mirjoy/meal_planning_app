require 'rails_helper'

RSpec.describe "a user can choose what foods to ban", type: :feature do 
	it "can select allergies" do
		visit new_meal_path
		click_link_or_button 'Add An Allergy'
		expect(page).to have_content("Dairy")
		# Dairy, Egg, Gluten, Peanut, Seafood, Sesame, Soy, Sulfite, Tree Nut, Wheat
	end

	xit "can add a certain diet" do
		visit new_meal_path
		expect(page).to have_content("Southwestern")
	# American, Italian, Asian, Mexican, Southern & Soul Food, French, Southwestern, Barbecue, Indian, Chinese, Cajun & Creole, English, Mediterranean, Greek, Spanish, German, Thai, Moroccan, Irish, Japanese, Cuban, Hawaiin, Swedish, Hungarian, Portugese
	end

		xit "can excude certain cuisines" do
		visit new_meal_path
		expect(page).to have_content("Southwestern")
	# American, Italian, Asian, Mexican, Southern & Soul Food, French, Southwestern, Barbecue, Indian, Chinese, Cajun & Creole, English, Mediterranean, Greek, Spanish, German, Thai, Moroccan, Irish, Japanese, Cuban, Hawaiin, Swedish, Hungarian, Portugese
	end

		xit "can type in a food and have it dynamically added to the banned list" do
		visit new_meal_path
		fill_in "banned_food[food]", with: "Brussel sprouts"
		expect(page).to have_content("brussel sprouts")
	# American, Italian, Asian, Mexican, Southern & Soul Food, French, Southwestern, Barbecue, Indian, Chinese, Cajun & Creole, English, Mediterranean, Greek, Spanish, German, Thai, Moroccan, Irish, Japanese, Cuban, Hawaiin, Swedish, Hungarian, Portugese
	end
end