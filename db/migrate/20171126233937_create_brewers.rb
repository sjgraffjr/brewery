class CreateBrewers < ActiveRecord::Migration[5.1]
  def change
    create_table :brewers do |t|
      t.string :name
      t.boolean :is_organic
      t.string :website
      t.string :status
      t.string :ext_id
      t.text :description
      t.string :status_display

      t.timestamps
    end
  end
end
