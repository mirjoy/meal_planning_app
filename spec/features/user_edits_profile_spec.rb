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
		save_and_open_page
		fill_in "user[user_name]", with: "muppet"
		fill_in "user[email]", with: "muppet@example.com"
		click_link_or_button("Submit")

		expect(current_path).to eq(account_path)
		expect(page).to have_content("muppet")
	end

	it "can see it's current information already in the form fields" do
		user_logs_in
		visit edit_path(User.first)

		expect(page).to have_selector("input[value='Phil']")
	end
end