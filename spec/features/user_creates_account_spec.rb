require "rails_helper"

RSpec.describe "user tries to create an account", type: :feature do
  it "can create an account " do
		user = build(:user)
		visit new_user_path
		fill_in "user[user_name]", with: user.user_name
		fill_in "user[email]", with: "rich@example.com"
		fill_in "user[password]", with: user.password
		fill_in "user[password_confirmation]", with: user.password    
		click_link_or_button("Submit")

		expect(page).to have_content("Plan Your Meals")
		expect(ActionMailer::Base.deliveries.length).to eq(1)
  end

  it "will be notified if account already exists for that email" do
		user = create(:user)
		visit new_user_path
		fill_in "user[user_name]", with: "Phil"
		fill_in "user[email]", with: user.email
		fill_in "user[password]", with: user.password
		fill_in "user[password_confirmation]", with: user.password    
		click_link_or_button("Submit")

		expect(page).to have_content("An account with that email already exists.")
  end

  it "cannot sign in without an accurate password confirmation" do
		user = build(:user)
		visit new_user_path
		
		fill_in "user[user_name]", with: user.user_name
		fill_in "user[email]", with: user.email
		fill_in "user[password]", with: user.password
		fill_in "user[password_confirmation]", with: "blah"
		click_link_or_button("Submit")

		expect(current_path).to eq(new_user_path)
		expect(page).to have_content("One of your fields is not correct")
	end

  it "cannot sign in with an obviously fake email" do
		user = build(:user)
		visit new_user_path
		
		fill_in "user[user_name]", with: user.user_name
		fill_in "user[email]", with: "hi"
		fill_in "user[password]", with: user.password
		fill_in "user[password_confirmation]", with: user.password
		click_link_or_button("Submit")

		expect(current_path).to eq(new_user_path)
		expect(page).to have_content("One of your fields is not correct")
  end

  it "cannot sign in without a user name" do
		user = build(:user)
		visit new_user_path
		
		fill_in "user[user_name]", with: ""
		fill_in "user[email]", with: user.email
		fill_in "user[password]", with: user.password
		fill_in "user[password_confirmation]", with: user.password
		click_link_or_button("Submit")

		expect(current_path).to eq(new_user_path)
		expect(page).to have_content("One of your fields is not correct")
	end

	it "cannot sign in without an email" do
		user = create(:user)
		visit new_user_path
	
		fill_in "user[user_name]", with: user.user_name
		fill_in "user[email]", with: ""
		fill_in "user[password]", with: user.password
		fill_in "user[password_confirmation]", with: user.password
		click_link_or_button("Submit")

		expect(current_path).to eq(new_user_path)
		expect(page).to have_content("One of your fields is not correct")
	end

	it "cannot sign in without a password" do
    user = build(:user)
    visit new_user_path
	
		fill_in "user[user_name]", with: user.user_name
		fill_in "user[email]", with: user.email
		fill_in "user[password]", with: ""
		fill_in "user[password_confirmation]", with: user.password
		click_link_or_button("Submit")

		expect(current_path).to eq(new_user_path)
		expect(page).to have_content("One of your fields is not correct")
	end

	it "cannot sign in without a password confirmation" do
		user = build(:user)
		visit new_user_path
	
		fill_in "user[user_name]", with: user.user_name
		fill_in "user[email]", with: user.email
		fill_in "user[password]", with: user.password
		click_link_or_button("Submit")

		expect(current_path).to eq(new_user_path)
		expect(page).to have_content("One of your fields is not correct")
	end
end