require 'rails_helper'

RSpec.describe BannedFood, type: :model do
  it "must have a name" do
  	new_food = BannedFood.new(name: nil)
  	new_food.save

  	expect(new_food.id).to eq(nil)
  end

  it "saves as downcase" do
  	new_food = BannedFood.create(name: "Pear")

  	expect(new_food.name).to eq("pear")
  end

   it "saves as singular" do
  	new_food = BannedFood.create(name: "Pears")

  	expect(new_food.name).to eq("pear")
  end

  it "must be unique" do
    new_food = BannedFood.create(name: "Pears")
    new_food2 = BannedFood.new(name: "Pears")
    new_food2.save
    expect(new_food2.id).to eq(nil)
  end
end
