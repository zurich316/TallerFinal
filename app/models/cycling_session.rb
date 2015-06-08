class CyclingSession < ActiveRecord::Base
	belongs_to :fitness_sessions
	has_many :type_cycling_sessionsgoers, :through => :fitness_sessions
end
