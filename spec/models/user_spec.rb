require "rails_helper"
require "support/factory_girl"

RSpec.describe User, type: :model do
	it "must have a name" do
		user = build(:user, user_name: nil)
		user.save
		expect(user).not_to be_valid
	end
end
