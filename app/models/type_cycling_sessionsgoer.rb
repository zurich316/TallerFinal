#Make the two sides access for Fitness Session and Cycling Session
class TypeCyclingSessionsgoer < ActiveRecord::Base
	has_many :fitness_sessions
	has_many :cycling_sessions, :through => :fitness_sessions
end
