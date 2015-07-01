#Make the two sides access for Band Type and Band
class BandTypegoer < ActiveRecord::Base
	has_many :bands
	has_many :band_types , :through =>:bands
end
