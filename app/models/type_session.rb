class TypeSession < ActiveRecord::Base
	has_many :fitness_sessions
	has_many :type_sessiongoer, :through => :fitness_sessions
end
