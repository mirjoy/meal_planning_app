require 'rails_helper'

RSpec.describe "user can add allergy", type: :feature, js: true do
	def login_user
		visit sign_in_page
		fill_in username, with: user.name
		fill_in
	end
	it "visits the new meal page and adds allergy" do
		login_user
		# user = build(:user)
		# allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

		visit new_meals_path
		click_link_or_button("Add An Allergy")
		click_link_or_button("Peanut")

		within(".allergy") do
			expect(page).to have_css("button.btn-danger")
		end
	end
end