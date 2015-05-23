class JoggingSession < ActiveRecord::Base
	has_many :fitness_sessions
	has_many :type_jogging_sessionsgoers, :through => :fitness_sessions
end
