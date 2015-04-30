class CreateMeal < ActiveRecord::Migration
  def change
    create_table :meals do |t|
    	t.string  :yummly_id
    	t.string  :source_name
    	t.string  :image_url
    	t.integer :user_id
    end
  end
end
