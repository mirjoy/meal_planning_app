class ReNameFacebookUidColumnInUsers < ActiveRecord::Migration
  def change
  	rename_column :users, :facebook_uid, :uid
  end
end
