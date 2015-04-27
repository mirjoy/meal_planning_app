class CreateUserAllergies < ActiveRecord::Migration
  def change
    create_table :user_allergies do |t|
    	t.integer :user_id
    	t.integer :allergy_id
    end
  end
end
