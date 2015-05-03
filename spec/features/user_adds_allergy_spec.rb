require 'rails_helper'
require 'helpers'

RSpec.configure do |c|
  c.include Helpers
end

RSpec.describe "user can add allergy", type: :feature do
	xit "visits the new meal page and adds allergy" do
		allergy = create(:allergy)
		user_logs_in

		visit new_meal_path
		click_link_or_button("Add An Allergy")
		click_link_or_button("Dairy")

		expect(page).to have_css("btn-danger")
	end
end