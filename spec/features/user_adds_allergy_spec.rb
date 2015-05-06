require 'rails_helper'
require 'helpers'

RSpec.configure do |c|
  c.include Helpers
end

RSpec.describe "user can add allergy", type: :feature, js: true do
	it "visits the new meal page and adds allergy" do
		allergy = create(:allergy)
		user_logs_in

		visit new_meal_path
		click_link_or_button("Add An Allergy")
		click_link_or_button("Dairy")
		within("#allergy") do
			expect(page).to have_css(".btn-danger")
		end
		expect(current_path).to eq(new_meal_path)
	end

	it "can delete an allergy" do
		allergy = create(:allergy)
		user_logs_in

		visit new_meal_path
		click_link_or_button("Add An Allergy")
		click_link_or_button("Dairy")
		click_link_or_button("Dairy")
		within("#allergy") do
			expect(page).not_to have_css(".btn-danger")
		end
	end
end