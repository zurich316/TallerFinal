class FitnessSession < ActiveRecord::Base
	belongs_to :user
	belongs_to :type_session
	belongs_to :type_sessiongoer
	has_many :jogging_sessions
	has_many :cycling_sessions
	has_many :weight_lifting_sessions

	#validates_presence_of :burned_calories, :hearth_rate
	

	def endTime
		self.time_finished=DateTime.now
	end

end
