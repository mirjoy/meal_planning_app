require "rails_helper"

RSpec.describe "User edits profile", type: :feature do
	it "can edit their profile" do
		user = create(:user)
		visit account_path
		click_link_or_button("Edit My Profile")
		fill_in "user[user_name]", with: "muppet"
		fill_in "user[email]", with: "muppet@example.com"
		click_link_or_button("Submit")

		expect(current_path).to eq(account_path)
	end

	it "can see it's current information already in the form fields" do
		user = create(:user)
		allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)
		visit edit_path(user)

		expect(page).to have_selector("input[value='Richard']")
	end
end