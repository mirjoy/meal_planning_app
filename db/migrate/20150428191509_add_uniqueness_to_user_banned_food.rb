class AddUniquenessToUserBannedFood < ActiveRecord::Migration
  def change
  	add_index :user_banned_foods, [:user_id, :banned_food_id], unique: true
  end
end
