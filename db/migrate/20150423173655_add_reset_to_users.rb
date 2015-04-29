class AddResetToUsers < ActiveRecord::Migration
  def change
    add_column :users, :reset_digest, :string
  end
end
