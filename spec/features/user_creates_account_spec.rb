require "rails_helper"

RSpec.describe "user tries to create an account", type: :feature do
	it "can create an account " do
	  	user = create(:user)
			visit new_user_path
	    
	    fill_in "user[user_name]", with: user.user_name
	    fill_in "user[email]", with: user.email
	    fill_in "user[password]", with: user.password
	    fill_in "user[password_confirmation]", with: user.password
	    click_link_or_button("Submit")

	    expect(page).to have_content(user.user_name)
	    expect(page).to have_content("Favorites")
	  end

  it "cannot sign in without an accurate password confirmation" do
			user = create(:user)
			visit new_user_path
	    
	    fill_in "user[user_name]", with: user.user_name
	    fill_in "user[email]", with: user.email
	    fill_in "user[password]", with: user.password
	    fill_in "user[password_confirmation]", with: "blah"
	    click_link_or_button("Submit")

	    expect(current_path).to eq(new_user_path)
	    expect(page).to have_content("Your passwords don't match up")
	end

  it "cannot sign in with an obviously fake email" do
		# As a User
		# When I visit '/'
		# And I click on 'Sign in'
		# And I enter an invalid email
		# And I enter my password
		# And I enter my password confirmation
  end
end