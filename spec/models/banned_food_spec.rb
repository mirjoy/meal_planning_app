require 'rails_helper'

RSpec.describe BannedFood, type: :model do
  it "must have a name" do
  	new_food = BannedFood.new(name: nil)
  	new_food.save
  	expect(new_food.id).to eq(nil)
  end
end
