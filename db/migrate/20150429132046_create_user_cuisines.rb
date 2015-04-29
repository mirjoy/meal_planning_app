class CreateUserCuisines < ActiveRecord::Migration
  def change
    create_table :user_cuisines do |t|
    	t.integer :user_id
    	t.integer :cuisine_id
    end
  end
end
