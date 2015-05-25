class TypeCyclingSessionsgoer < ActiveRecord::Base
	has_many :fitness_sessions
	has_many :cycling_sessions, :through => :fitness_sessions
end
