class WeightLiftingSession < ActiveRecord::Base
	belongs_to :fitness_sessions
	has_many :type_weight_lifting_sessionsgoers, :through => :fitness_sessions
end
