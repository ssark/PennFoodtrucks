class CreateFoodTrucks < ActiveRecord::Migration
  def change
    create_table :food_trucks do |t|
      t.string :name
      t.string :cuisine
      t.string :desc
      t.string :location
      t.integer :open
      t.integer :close
      t.timestamps null: false
    end
  end
end
