require "rails_helper"
require 'helpers'

RSpec.configure do |c|
  c.include Helpers
end

RSpec.describe "User edits profile", type: :feature do
	it "can edit their profile" do
		user_logs_in
		visit account_path
		click_link_or_button("Edit My Profile")
		fill_in "user[user_name]", with: "muppet"
		fill_in "user[email]", with: "muppet@example.com"
		click_link_or_button("Submit")

		expect(current_path).to eq(account_path)
		expect(page).to have_content("muppet")
	end

	it "cannot remove essential fields from their profile when editing" do
		user_logs_in
		visit account_path
		click_link_or_button("Edit My Profile")
		fill_in "user[user_name]", with: ""
		click_link_or_button("Submit")

		expect(page).to have_content("You are missing some fields.")
	end

	it "cannot see profile without being signed in" do
		visit account_path

		expect(page).to have_content("You are not authorized to access this page")
	end

	it "can see it's current information already in the form fields" do
		user_logs_in
		visit edit_user_path(User.first)

		expect(page).to have_selector("input[value='Phil']")
	end
end