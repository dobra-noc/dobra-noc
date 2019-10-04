class CreateLocations < ActiveRecord::Migration[5.2]
  def change
    create_table :locations do |t|
      t.string :address, default: "Nieznany"
      t.text :description
      t.string :latitude
      t.string :longitude

      t.timestamps
      t.index :address, unique: true
      t.index [:latitude, :longitude], unique: true
    end
  end
end
