#Jogging session config and methods
class JoggingSession < ActiveRecord::Base
	belongs_to :fitness_sessions
	has_many :type_jogging_sessionsgoers, :through => :fitness_sessions
end
