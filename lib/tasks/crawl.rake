

namespace :crawl do
	desc "Crawl the brewerydb locations api"
	task locations: :environment do
		(50..100).each do  |i| 
			# go to brewery db api and get data
			locations = Brewerydb::Location.index(p: i)

			# loop over their data and store it in my tables
	 		locations.each do|location|

	 			# if we have already gotten this brewer before don't create it again
				brewer = Brewer.find_or_initialize_by(ext_id: location.brewery.id) do |b|
					b.assign_attributes(
					  is_organic: location.brewery.is_organic,
					  website: location.brewery.website,
					  status: location.brewery.status,
					  description: location.brewery.description,
					  status_display: location.brewery.status_display,
					  name: location.brewery.name
					)
					b.save
				end

				# if we have already gotten this location before don't create it again
				Location.find_or_initialize_by(ext_id: location.id) do |l|
					l.update_attributes(
					  region: location.region,
					  latitude: location.latitude,
					  longitude: location.longitude,
					  phone: location.phone,
					  zipcode: location.postal_code,
					  country_iso_code: location.country_iso_code,
					  brewer_id: brewer.id,
					  address: location.street_address
					)
	      		end
      		end
      	end
	end
end

