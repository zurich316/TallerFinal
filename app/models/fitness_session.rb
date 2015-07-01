#Fitness Session config and methods
class FitnessSession < ActiveRecord::Base
	belongs_to :user
	belongs_to :type_session
	belongs_to :type_sessiongoer
	has_many :jogging_sessions
	has_many :cycling_sessions
	has_many :weight_lifting_sessions

end
