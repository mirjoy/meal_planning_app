require "rails_helper"

RSpec.describe "user tries to create an account", type: :feature do
	it "can create an account " do
  	user = create(:user)
		visit new_user_path
    
    fill_in "user[user_name]", with: user.user_name
    fill_in "user[email]", with: "rich@example.com"
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
    expect(page).to have_content("One of your fields is not correct")
	end

  it "cannot sign in with an obviously fake email" do
		user = create(:user)
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
  	user = create(:user)
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
		user = create(:user)
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
		user = create(:user)
		visit new_user_path
    
    fill_in "user[user_name]", with: user.user_name
    fill_in "user[email]", with: user.email
    fill_in "user[password]", with: user.password
    click_link_or_button("Submit")

    expect(current_path).to eq(new_user_path)
    expect(page).to have_content("One of your fields is not correct")
	end
end