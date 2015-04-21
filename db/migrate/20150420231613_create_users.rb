class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :user_name
      t.string :provider
      t.string :password_digest
      t.string :email

      t.timestamps null: false
    end
  end
end
