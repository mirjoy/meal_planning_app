require "rails_helper"

RSpec.describe Meal, type: :model do
	it "can save a valid meal" do
		meal = create(:meal)
		expect(meal.id).to eq(1)
	end

	it { should belong_to(:user) }
	it { should have_many(:ingredients) }
end
