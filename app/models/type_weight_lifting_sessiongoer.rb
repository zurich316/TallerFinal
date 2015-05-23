class TypeWeightLiftingSessiongoer < ActiveRecord::Base
	has_many :fitness_sessions
	has_many :weight_lifting_sessions, :through => :fitness_sessions

end
