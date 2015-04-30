class AddNametoMeals < ActiveRecord::Migration
  def change
  	add_column :meals, :name, :string
  end
end
