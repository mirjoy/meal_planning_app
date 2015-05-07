class AddUniquenessToUserAllergy < ActiveRecord::Migration
  def change
  	add_index :user_allergies, [:user_id, :allergy_id], unique: true
  end
end
