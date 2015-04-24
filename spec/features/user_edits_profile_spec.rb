require "rails_helper"

RSpec.describe "User edits profile", type: :feature do
	it "can visit the edit page" do
		user = create(:user)
		allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)
		visit account_path
		click_link_or_button("Edit My Profile")

		expect(current_path).to eq(edit_user_path(user))
	end

	xit "can see it's current information already in the form fields" do
		user = create(:user)
		allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)
		visit edit_user_path(user)

		expect(page).to have_content(user.user_name)
		fill_in "user[user_name]", with: "muppet"
	end
end