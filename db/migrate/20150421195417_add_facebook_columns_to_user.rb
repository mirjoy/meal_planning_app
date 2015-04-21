class AddFacebookColumnsToUser < ActiveRecord::Migration
  def change
  	add_column :users, :login_status, :string
    add_column :users, :facebook_uid, :string
    add_column :users, :token, :string
    add_column :users, :expires_at, :string
  end
end
