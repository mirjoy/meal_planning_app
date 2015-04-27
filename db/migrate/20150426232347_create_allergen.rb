class CreateAllergen < ActiveRecord::Migration
  def change
    create_table :allergies do |t|
    	t.string :name
    end
  end
end
