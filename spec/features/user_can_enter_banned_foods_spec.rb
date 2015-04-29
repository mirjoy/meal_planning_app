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

	def user_visits_new_meal_path
		user_logs_in
		visit new_meal_path
	end
end

RSpec.describe "can type in a food and have it dynamically added to the banned list", type: :feature, js: true do 

	it "user adds a food" do
		user = create(:user)
		allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)
		visit new_meal_path
		click_link_or_button("Specific Foods")
		fill_in "banned_food[name]", with: "Brussel sprouts"
		find("#click-me").native.send_keys(:enter)
		save_and_open_page
		expect(page).to have_content("brussel sprouts")
	end
end