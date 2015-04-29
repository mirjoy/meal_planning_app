require 'rails_helper'

RSpec.describe "a user can choose what foods to ban", type: :feature do 
	it "can select allergies" do
		user = build(:user)
		allergy = create(:allergy)
		allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

		visit new_meal_path
		click_link_or_button 'Add An Allergy'
		expect(page).to have_content("Dairy")
	end

	xit "can add a certain diet" do
		visit new_meal_path
		expect(page).to have_content("Southwestern")
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