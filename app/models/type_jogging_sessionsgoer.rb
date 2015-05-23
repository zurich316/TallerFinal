class TypeJoggingSessionsgoer < ActiveRecord::Base
	has_many :fitness_sessions
	has_many :jogging_sessions, :through => :fitness_sessions
end
