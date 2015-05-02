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
		save_and_open_page
		click_link_or_button("Add An Allergy")
		click_link_or_button("Dairy")

		within("#allergy") do
			expect(page).to have_css("button.btn-danger")
		end
	end
end