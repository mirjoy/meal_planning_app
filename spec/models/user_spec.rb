require "rails_helper"
require "support/factory_girl"

RSpec.describe User, type: :model do
	it "must have a name" do
		user = build(:user, user_name: nil)
		user.save
		expect(user).not_to be_valid
	end

	it "must have a unique name" do
		user = create(:user, user_name: "nancy")
		user2 = build(:user, user_name: "nancy")
		user2.save
		expect(user2).not_to be_valid
	end

	it "must have a password" do
		user = build(:user, password: nil)
		user.save
		expect(user).not_to be_valid
	end
end
