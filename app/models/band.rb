class Band < ActiveRecord::Base
	belongs_to :user
	belongs_to :band_type
	belongs_to :band_typegoer
	has_many :band_informations
	has_many :dream_sessions
	validates :code, presence: true , length: {is: 12}
	validate :valid_code_number?
	def valid_code_number?
		#Validates if code has just alphanumeric characters.
		unless self.code.scan(/[a-z\W]/).empty?
	      errors.add(:code, "cannot have non-alphanumeric or lowercase characters")
	    end
	end


	
	

end

