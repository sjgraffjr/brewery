class AddImgToBreweries < ActiveRecord::Migration[5.1]
  def change
  	add_column(:brewers, :img_url, :string)
  end
end
