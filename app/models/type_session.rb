class TypeSession < ActiveRecord::Base
	has_many :sessions
	has_many :type_sessiongoer, :through => :sessions
end
