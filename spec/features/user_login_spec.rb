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

  it "can sign in with an email and password" do
  	user = create(:user)
		visit login_path

    fill_in "session[email]", with: user.email
    fill_in "session[password]", with: user.password
    click_link_or_button("Submit")

    expect(page).to have_content(user.user_name)
    expect(page).to have_content("Favorites")
  end

  it "cannot sign in with an inaccurate password" do
		user = create(:user)
    visit login_path

    fill_in "session[email]", with: user.email
    fill_in "session[password]", with: "pasword"
    click_link_or_button("Submit")

    expect(page).to have_content("Wrong user name or password")
	end


  it "cannot sign in with an invalid email" do
    user = create(:user)
    visit login_path

    fill_in "session[email]", with: "cat@example.com"
    fill_in "session[password]", with: user.password
    click_link_or_button("Submit")

    expect(page).to have_content("Wrong user name or password")
  end

end