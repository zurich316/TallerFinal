#Band type model for config and methods
class BandType < ActiveRecord::Base
	has_many :bands
	has_many :band_typegoer, :through => :bands
end
