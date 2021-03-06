class CreateLocations < ActiveRecord::Migration[5.1]
  def change
    create_table :locations do |t|
      t.string :address
      t.string :locality
      t.string :zipcode
      t.string :region
      t.decimal :latitude, {scale: 6, precision: 10}
      t.decimal :longitude, {scale: 6, precision: 10}
      t.string :phone
      t.string :country_iso_code
      t.integer :brewer_id
      t.string :ext_id
      t.boolean :isClosed

      t.timestamps
    end
  end
end
