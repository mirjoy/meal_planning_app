require "rails_helper"

RSpec.describe Allergy, type: :model do
	it "can save a valid allergy" do
		allergy = create(:allergy)
		expect(allergy.id).to eq(1)
	end

	it "must have a name" do
		allergy = build(:allergy, name: nil)
		allergy.save
		expect(allergy.id).to be_nil
	end

	it { should have_many(:users) }
end
