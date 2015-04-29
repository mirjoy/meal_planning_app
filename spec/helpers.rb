module Helpers
  def user_logs_in
  	user = User.create(user_name: "Phil", email: "phil@example.com", phone_number: 555-5555,
  										 password: "password", password_confirmation: "password")
		visit login_path

    fill_in "session[email]", with: user.email
    fill_in "session[password]", with: user.password
    click_link_or_button("Submit")
  end

	def user_logs_in_with_facebook
    visit root_path
    mock_auth_hash
    within(".nav") do
      click_link "Log In"
    end
    find("#facebook-login").click
	end
end