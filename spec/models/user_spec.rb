require "rails_helper"
require "support/factory_girl"

RSpec.describe User, type: :model do
	it "must have a name" do
		user = create(:user, name: nil)
		expect(user).not_to be_valid
	end
end
