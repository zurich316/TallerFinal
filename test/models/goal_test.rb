#Goals tests
require 'test_helper'

class GoalTest < ActiveSupport::TestCase
	setup do
	  	@goal_steps = goals(:one)
	  	@goal_weight = goals(:two)
	  	@goal_calories = goals(:three)
	  	@goal_dream = goals(:four)
	  	@goal_heart_rate = goals(:five)
	  end

	test 'Calculo progreso' do
		assert_equal(15000,@goal_steps.calculate_steps(band_informations(:one)),'Correct calculation of steps')
		assert_equal(16000,@goal_calories.calculate_calories(band_informations(:one)),'Correct calculation of calories')
		assert_equal(nil,@goal_dream.calculate_dream,'Correct calculation of dream goal progress')
		assert_equal(75,@goal_weight.calculate_weight,'Correct calculation of weight goal progress')
		assert_equal(nil,@goal_heart_rate.calculate_heart_rate,'Correct calculation of heart rate goal progress')
	end
	test 'Completed goal' do
		assert_equal(false,@goal_steps.complete_goal,'Not completed')
		@goal_steps.progress = @goal_steps.goal
		@goal_steps.save
		assert_equal(true,@goal_steps.complete_goal,'Completed')
	end

	test 'Calculo por periodo' do
		@one_register = band_informations(:one)
		@one_register.registered_date = Time.now
		@one_register.save
		assert_equal(nil,@goal_steps.calculate_day(@one_register),'Correct for daily goal')
		assert_equal(75,@goal_weight.calculate_month(@one_register),'Correct for monthly goal')
		assert_equal(nil,@goal_calories.calculate_year(@one_register),'Correct for yearly goal')
	end
  # test "the truth" do
  #   assert true
  # end
end
