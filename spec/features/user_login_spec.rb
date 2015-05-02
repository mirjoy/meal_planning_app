require "rails_helper"
require 'helpers'

RSpec.configure do |c|
  c.include Helpers
end

RSpec.describe "user tries to login", type: :feature do
  it "can sign in with Facebook account and receive a welcome email" do
    user_logs_in_with_facebook

    expect(page).to have_content("Miriam Joy")
    expect(page).to have_content("Log Out")

    # expect(current_email.subject).to eq("Thanks for joining Delistcious!")
    expect(ActionMailer::Base.deliveries.length).to eq(1)

    clear_emails
  end

  it "can tell if user already exists and won't sent them a welcome email" do
    user_logs_in_with_facebook
    click_link_or_button("Log Out")
    user_logs_in_with_facebook

    expect(ActionMailer::Base.deliveries.length).to eq(0)
  end 

  xit "is notified if trying to sign in with email when they initially signed up with facebook" do
    user = User.create(user_name: "me", provider: "facebook", email: "me@example.com", password: nil)
    visit login_path

    fill_in "session[email]", with: user.email
    fill_in "session[password]", with: "password"
    click_link_or_button("Submit")

    expect(page).to have_content("Did you sign up with Facebook?")
  end

  it "can sign in with an email and password" do
  	user = create(:user)
		visit login_path

    fill_in "session[email]", with: user.email
    fill_in "session[password]", with: user.password
    click_link_or_button("Submit")

    expect(page).to have_content("Sign in successful")
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