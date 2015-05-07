require "rails_helper"

RSpec.describe User, type: :model do
	it "can save a valid user" do
		user = create(:user)
		expect(user.id).to eq(1)
	end

	it "must have a name" do
		user = build(:user, user_name: nil)
		user.save
		expect(user).not_to be_valid
	end

	it "must have an email" do
		user = build(:user, email: nil)
		user.save
		expect(user).not_to be_valid
	end

	it { should have_many(:banned_foods) }
	it { should have_many(:allergies) }
	it { should have_many(:diets) }
	it { should have_many(:cuisines) }
	it { should have_many(:meals) }
end
