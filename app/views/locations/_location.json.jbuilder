json.extract! location, :id, :address, :city, :state, :zipcode, :region, :latitude, :longitude, :phone, :country_iso_code, :brewer_id, :created_at, :updated_at
json.url location_url(location, format: :json)
