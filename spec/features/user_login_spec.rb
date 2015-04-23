require "rails_helper"

RSpec.describe "user tries to login", type: :feature do
  it "can sign in with Facebook account" do
    visit root_path
    mock_auth_hash
    within(".nav") do
    	click_link "Log In"
    end
    find("#facebook-login").click

    expect(page).to have_content("Miriam Joy")
    expect(page).to have_content("Log Out")
  end

  xit "can sign in with an email and password" do
  	user = create(:user)
		visit login_path

    fill_in "session[email]", with: user.email
    fill_in "session[password]", with: user.password

    expect(page).to have_content(user.user_name)
    expect(page).to have_content("Favorites")
  end

  xit "cannot sign in with an inaccurate password" do
		# As a User
		# When I visit '/'
		# And I click on 'Sign in'
		# And I enter my email
		# And I enter an incorrect my password
		# Then I see an error message "Your password is incorrect"
	end


  xit "cannot sign in with an invalid email" do
    # As a User
    # When I visit '/'
    # And I click on 'Sign in'
    # And I enter an incorrect email
    # And I enter my password
    # Then I see an error message "Your password is incorrect"
  end

end