

namespace :crawl do
	desc "Crawl the brewerydb locations api"
	task locations: :environment do
		(1..211).each do  |i| 
			# go to brewery db api and get data
			locations = Brewerydb::Location.index(p: i)

			# loop over their data and store it in my tables
	 		locations.each do|location|

	 			# if we have already gotten this brewer before don't create it again
				brewer = Brewer.find_or_initialize_by(ext_id: location.brewery.id) 
				brewer.update_attributes(
				  is_organic: location.brewery.is_organic,
				  website: location.brewery.website,
				  status: location.brewery.status,
				  description: location.brewery.description,
				  status_display: location.brewery.status_display,
				  name: location.brewery.name
				)

				# if we have already gotten this location before don't create it again
				l = Location.find_or_initialize_by(ext_id: location.id) 
				l.update_attributes(
					locality: location.locality,
				  region: location.region,
				  latitude: location.latitude,
				  longitude: location.longitude,
				  phone: location.phone,
				  zipcode: location.postal_code,
				  country_iso_code: location.country_iso_code,
				  brewer_id: brewer.id,
				  address: location.street_address,
				  isClosed: location.is_closed == "Y"
				)
    	end
    end
	end
end

