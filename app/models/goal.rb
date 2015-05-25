class Goal < ActiveRecord::Base
    validates :frequency, :goal, presence: true #, length:{minimum 25}
	belongs_to :user
	belongs_to :type_goal
	belongs_to :type_goalgoer
end
