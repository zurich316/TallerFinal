class Goal < ActiveRecord::Base
	belongs_to :user
	belongs_to :type_goal
	belongs_to :type_goalgoer
	validates_presence_of :frequency, :goal
end
