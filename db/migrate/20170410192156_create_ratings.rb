class CreateRatings < ActiveRecord::Migration
  def change
    create_table :ratings do |t|
      t.integer :number
      t.references :user
      t.references :food_truck

      t.timestamps null: false
    end
  end
end
