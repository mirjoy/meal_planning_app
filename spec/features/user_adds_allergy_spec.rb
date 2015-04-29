require 'rails_helper'

RSpec.describe "user can add allergy", type: :feature, js: true do
	it "visits the new meal page and adds allergy" do
		user = build(:user)
		allergy = create(:allergy)
		allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

		visit new_meal_path
		click_link_or_button("Add An Allergy")
		click_link_or_button("Dairy")

		within("#allergy") do
			expect(page).to have_css("button.btn-danger")
		end
	end
end