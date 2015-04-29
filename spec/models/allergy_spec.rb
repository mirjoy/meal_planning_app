require "rails_helper"

RSpec.describe Allergy, type: :model do
	it "must have a name" do
		allergy = build(:allergy, name: nil)
		allergy.save
		expect(allergy.id).to be_nil
	end
end
