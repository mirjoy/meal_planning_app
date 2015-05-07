require "rails_helper"

RSpec.describe Diet, type: :model do
	it "can save a valid diet" do
		diet = create(:diet)
		expect(diet.id).to eq(1)
	end

	it "must have a name" do
		diet = build(:diet, name: nil)
		diet.save
		expect(diet.id).to be_nil
	end

	it { should have_many(:users) }
end
