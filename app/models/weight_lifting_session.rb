class WeightLiftingSession < ActiveRecord::Base
	has_many :fitness_sessions
	has_many :type_weight_lifting_sessionsgoers, :through => :fitness_sessions
end
