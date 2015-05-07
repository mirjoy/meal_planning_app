class AddMetaValueToAllergy < ActiveRecord::Migration
  def change
  	add_column :allergies, :meta_value, :string
  end
end
