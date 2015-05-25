class CyclingSession < ActiveRecord::Base
	has_many :fitness_sessions
	has_many :type_cycling_sessionsgoers, :through => :fitness_sessions
end
