require 'rails_helper'

RSpec.describe Cuisine, type: :model do
 	it "can save a valid cuisine" do
		cuisine = create(:cuisine)
		expect(cuisine.id).to eq(1)
	end

  it "must have a name" do
		cuisine = build(:cuisine, name: nil)
		cuisine.save
		expect(cuisine.id).to be_nil
	end

	it { should have_many(:users) }
end
