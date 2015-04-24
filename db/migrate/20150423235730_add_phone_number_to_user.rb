class AddPhoneNumberToUser < ActiveRecord::Migration
  def change
  	add_column :users, :phone_number, :bigint
  end
end
