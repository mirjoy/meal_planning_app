class CreateTableUserBannedFoods < ActiveRecord::Migration
  def change
    create_table :user_banned_foods do |t|
    	t.integer :user_id
    	t.integer :banned_food_id
    end
  end
end
