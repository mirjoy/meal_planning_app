class AddUniquenessToUserDiets < ActiveRecord::Migration
  def change
  	add_index :user_diets, [:user_id, :diet_id], unique: true
  end
end
