require "rails_helper"
require "sample_parsed_json"

RSpec.describe User, type: :model do
	it "must have a name" do
		user = build(:user, user_name: nil)
		user.save
		s = Sample.new
		binding.pry
		expect(user).not_to be_valid
	end
end
