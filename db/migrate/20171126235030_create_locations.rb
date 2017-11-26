class CreateLocations < ActiveRecord::Migration[5.1]
  def change
    create_table :locations do |t|
      t.string :address
      t.string :city
      t.string :state
      t.string :zipcode
      t.string :region
      t.decimal :latitude
      t.decimal :longitude
      t.string :phone
      t.string :country_iso_code
      t.integer :brewer_id

      t.timestamps
    end
  end
end
