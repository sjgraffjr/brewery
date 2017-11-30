class Location < ApplicationRecord
	belongs_to :brewer
	scope :opened, -> { where(isClosed: false) } #scope little piece of sql query you can combine the different ones together. scopes are to get things out of db. validates stop things from going into db
end
