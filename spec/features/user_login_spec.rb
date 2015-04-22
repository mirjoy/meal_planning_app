require "rails_helper"

RSpec.describe "user tries to login", type: :feature do
  it "can sign in with Facebook account" do
    visit '/'
    mock_auth_hash
    within(".nav") do
    	click_link "Sign In"
    end
    visit account_path
    expect(page).to have_content("Miriam Joy")
    expect(page).to have_content("Sign out")
  end

  it "can sign in with an email and password" do
  # 	As a User
		# When I visit '/'
		# And I click on 'Sign in'
		# And I enter my email
		# And I enter my password
		# And I enter my password confirmation
		# And I am redirected to '/account' 
		# Then I can see "Favorites" and "Account" in the navbar
  end

  it "cannot sign in without an accurate password confirmation" do
		# As a User
		# When I visit '/'
		# And I click on 'Sign in'
		# And I enter my email
		# And I enter my password
		# And I enter a password confirmation that doesn't match
		# Then I see an error message "These passwords do not match"
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