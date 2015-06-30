class Goal < ActiveRecord::Base
    validates :frequency, :goal, presence: true #, length:{minimum 25}
	belongs_to :user
	belongs_to :type_goal
	belongs_to :type_goalgoer
	validates_presence_of :frequency, :goal



	def calculate_steps(one)
       if @goal.type_goal.tip == "Steps"
         @goal.progress = @goal.progress + one.steps
       end
    end
    def calculate_calories(one)
       if @goal.type_goal.tip == "Calories"
        @goal.progress = @goal.progress + one.calories
       end
    end
    def calculate_dream(one)
       if @goal.type_goal.tip == "Dream"
         @goal.progress = @goal.goal
       end
    end
    def calculate_weight(one)
       if @goal.type_goal.tip == "Weight"
         @goal.progress = User.find(self.user_id).weight
       end
    end

    def calculate_heart_rate
      @today=current_user.bands.first.band_informations.where('registered_date BETWEEN ? AND ?',Time.now.beginning_of_day, Time.now.end_of_day).average(:heart_rate)
      if @goal.type_goal.tip == "Heart Rate"
      @goal.progress = @today
      end
    end

    def calculate_day(one)
      if @goal.frequency=="Day" && @goal.created_at.month == one.created_at.month && @goal.created_at.day == one.created_at.day && @goal.created_at.year == one.created_at.year
       calculate_calories(one)
      calculate_steps(one)
      calculate_dream(one)
      calculate_weight(one)
      end 
    end

    def calculate_month(one)
      if @goal.frequency=="Month" && @goal.created_at.month == one.created_at.month && @goal.created_at.year == one.created_at.year
      calculate_calories(one)
      calculate_steps(one)
      calculate_dream(one)
      calculate_weight(one)
      end 
    end

    def calculate_year(one)
      if @goal.frequency=="Year" && @goal.created_at.year == one.created_at.year
       calculate_calories(one)
      calculate_steps(one)
      calculate_dream(one)
      calculate_weight(one)
      end 
    end

    def complete_goal
      if @goal.progress >= @goal.goal
        @goal.complete == true
      else 
        @goal.complete == false

      end
    end
end
