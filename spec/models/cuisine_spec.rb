require 'rails_helper'

RSpec.describe Cuisine, type: :model do
  it "must have a name" do
		cuisine = build(:cuisine, name: nil)
		cuisine.save
		expect(cuisine.id).to be_nil
	end

	xit "use shoulda matchers to test relationship with user" do
	end
end