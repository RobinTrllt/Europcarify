class CreateVehicles < ActiveRecord::Migration[6.0]
  def change
    create_table :vehicles do |t|
      t.integer :price
      t.string :brand
      t.string :genre
      t.string :model
      t.string :photo
      t.integer :capacity
      t.string :fuel
      t.integer :doors
      t.boolean :ac
      t.references :agency, null: false, foreign_key: true

      t.timestamps
    end
  end
end
