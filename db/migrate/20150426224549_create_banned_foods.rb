class CreateBannedFoods < ActiveRecord::Migration
  def change
    create_table :banned_foods do |t|
    	t.string :name
      t.timestamps null: false
    end
  end
end
