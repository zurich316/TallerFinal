class Band < ActiveRecord::Base
	belongs_to :user
	belongs_to :band_type
	belongs_to :band_typegoer
	
end
