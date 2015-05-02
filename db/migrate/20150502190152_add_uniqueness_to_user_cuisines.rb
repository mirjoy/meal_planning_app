class AddUniquenessToUserCuisines < ActiveRecord::Migration
  def change
  	add_index :user_cuisines, [:user_id, :cuisine_id], unique: true
  end
end
