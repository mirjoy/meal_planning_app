class CreateCuisineTable < ActiveRecord::Migration
  def change
    create_table :cuisines do |t|
      t.string :name
    end
  end
end
