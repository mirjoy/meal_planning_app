require "rails_helper"

RSpec.describe Diet, type: :model do
	it "must have a name" do
		diet = build(:diet, name: nil)
		diet.save
		expect(diet.id).to be_nil
	end
end
