class Band < ActiveRecord::Base
	belongs_to :user
	belongs_to :band_type
	belongs_to :band_typegoer
	validates :code, presence: true , length: {is: 12}
	validate :valid_code_number?
	def valid_code_number?
		#Validates if code has just alphanumeric characters.
		unless self.code.scan(/[a-z\W]/).empty?
	      errors.add(:code, "cannot have non-alphanumeric or lowcase characters")
	    end
	end

end
