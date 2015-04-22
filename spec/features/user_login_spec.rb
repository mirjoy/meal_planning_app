require "rails_helper"

RSpec.describe "admin updates business details", type: :feature do
  it "can sign in user with Facebook account" do
    visit '/'
    mock_auth_hash
    within(".nav") do
    	click_link "Sign In"
    end
    visit account_path
    expect(page).to have_content("Miriam Joy")
    expect(page).to have_content("Sign out")
  end
end