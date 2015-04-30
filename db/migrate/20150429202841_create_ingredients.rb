class CreateIngredients < ActiveRecord::Migration
  def change
    create_table :ingredients do |t|
    	t.integer :meal_id
    	t.string :name
    end
  end
end
