class AddMetaValueToDiets < ActiveRecord::Migration
  def change
  	add_column :diets, :meta_value, :string
  end
end
