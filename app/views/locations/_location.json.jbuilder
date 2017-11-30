json.extract! location, :id, :address, :locality, :zipcode, :region, :latitude, :longitude, :phone, :country_iso_code, :brewer, :isClosed, :created_at, :updated_at
json.url location_url(location, format: :json)
