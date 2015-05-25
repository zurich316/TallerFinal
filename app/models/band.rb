class Band < ActiveRecord::Base
	belongs_to :user
	belongs_to :band_type
	belongs_to :band_typegoer

	after_create :automatic_goals

	def automatic_goals

		if current_user.goals.count==0
			if current_user.sex == male
    		goals = [{frequency:"day",goal: :steps_all,user_id:current_user.id,type_goal_id: 1},{frequency:"day",goal: :sleep_all,user_id:current_user.id,type_goal_id: 2},{frequency:"day",goal: :weight_all,user_id:current_user.id,type_goal_id: 3},{frequency:"day",goal: :calories_male,user_id:current_user.id,type_goal_id: 4}]
    		else
	    		goals = [{frequency:"day",goal: :steps_all,user_id:current_user.id,type_goal_id: 1},{frequency:"day",goal: :sleep_all,user_id:current_user.id,type_goal_id: 2},{frequency:"day",goal: :weight_all,user_id:current_user.id,type_goal_id: 3},{frequency:"day",goal: :calories_female,user_id:current_user.id,type_goal_id: 4}]
	    			
			      goals.each do |g|
			        Goal.create(frequency: g[:frequency], goal: g[:goal], user_id: g[:user_id], type_goal_id: g[:type_goal_id])

			      end
			end
   		end

		


	end

	def steps_all


		if :years_calculate <= 13
		 step1 = 15000

		 return step1

		else 

				if :years_calculate <= 50 && :years_calculate > 13 
					step1=10000

		 			return step1
				else
					step1=2000


					 return step1

				end
		end


	end

	

	def sleep_all  # calculo de suenho para personas mayores a los 14 anhos 

		if :years_calculate < 18

			return sleep1 = 10
		end
		if :years_calculate >= 18 && :years_calculate < 26

			return sleep1 = 8
		end
		if :years_calculate > 25 

			return sleep1 = 7
		end



	end

	

	def weight_all  # calcula el peso ideal
		weight_ideal = 0,75 ((current_user.height*100) – 150) + 50

		return weight_ideal
	end

	

	def calories_male # calcula cuantas calorias debe quemar un hombre
		tmb = (10*current_user.weight)+(6.25*current_user.height)-(5*:years_calculate)+5

		tmb = tmb*22
		tmb = tmb*0.50
		tmb = tmb + tmb_activo
		tmb_digestion = tmb*0.10
		tmb = tmb + tmb_digestion
		if current_user.weight - :weight_all > 0

			return tmb = tmb + 500

		else

			return tmb

		end
	end

	def calories_female  # calcula cuantas calorias debe quemar una mujer

		tmb = (10*current_user.weight)+(6.25*current_user.height)-(5*:years_calculate)-161
		tmb = tmb*22
		tmb_activo = tmb*0.50
		tmb = tmb + tmb_activo
		tmb_digestion = tmb*0.10
		tmb = tmb + tmb_digestion
		if current_user.weight - :weight_all > 0

			return tmb = tmb + 500

		else

			return tmb

		end


	end

	def years_calculate  # calcula la edad del usuario

		year1=current_user.birthdate.year
		year2= Time.now.year
		year1=year2-year1

		return year1

	end
	
end

