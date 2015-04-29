class CreateDiet < ActiveRecord::Migration
  def change
    create_table :diets do |t|
    	t.string :name
    end
  end
end
