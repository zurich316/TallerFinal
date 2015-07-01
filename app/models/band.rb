class Band < ActiveRecord::Base
	belongs_to :user
	belongs_to :band_type
	belongs_to :band_typegoer
	has_many :band_informations
	has_many :dream_sessions
	validates :code, presence: true , length: {is: 12}
	validate :valid_code_number?

	def valid_code_number?
		#Validates if code has just alphanumeric characters.
		unless self.code.scan(/[a-z\W]/).empty?
	      errors.add(:code, "cannot have non-alphanumeric or lowercase characters")
	      nil
	    end
	end

	def goals_automatics
		sexo = User.find(self.user_id).sex

       if sexo == "Male"
        goals = [{frequency:"Day",goal: steps_all,user_id:self.user_id,type_goal_id: 1,automatic:true},{frequency:"Day",goal: sleep_all,user_id:self.user_id,type_goal_id: 2,automatic:true},{frequency:"Year",goal: weight_all,user_id:self.user_id,type_goal_id: 3,automatic:true},{frequency:"Day",goal: calories_male,user_id:self.user_id,type_goal_id: 4,automatic:true},{frequency:"Day",goal: heart_rate,user_id:self.user_id,type_goal_id: 5,automatic:true}]
       else
        goals = [{frequency:"Day",goal: steps_all,user_id:self.user_id,type_goal_id: 1,automatic:true},{frequency:"Day",goal: sleep_all,user_id:self.user_id,type_goal_id: 2,automatic:true},{frequency:"Year",goal: weight_all,user_id:self.user_id,type_goal_id: 3,automatic:true},{frequency:"Day",goal: calories_female,user_id:self.user_id,type_goal_id: 4,automatic:true},{frequency:"Day",goal: heart_rate,user_id:self.user_id,type_goal_id: 5,automatic:true}]
       end
       return goals
    end
   
    def steps_all


    if years_calculate <= 13
     step1 = 15000
     return step1
    else 
        if years_calculate <= 50 && years_calculate > 13 
          step1=10000
          return step1
        else
          step1=2000
           return step1
        end
    end
  end

  

  def sleep_all  # calculo de suenho para personas mayores a los 14 anhos 
    if years_calculate < 18
      return sleep1 = 10
    end
    if years_calculate >= 18 && years_calculate < 26
      return sleep1 = 8
    end
    if years_calculate > 25 
      return sleep1 = 7
    end
  end

  

  def weight_all  # calcula el peso ideal
    weight_ideal = ((0.75*(User.find(self.user_id).height - 150))+ 50)

    return weight_ideal
  end

  

  def calories_male # calcula cuantas calorias debe quemar un hombre
    tmb = (10*User.find(self.user_id).weight)+(6.25*User.find(self.user_id).height)-(5*years_calculate)+5
    tmb_activo = tmb*0.50
    tmb = tmb + tmb_activo
    tmb_digestion = tmb*0.10
    tmb = tmb + tmb_digestion
    if User.find(self.user_id).weight - weight_all > 0
      return tmb = tmb + 500
    else
      return tmb
    end
  end

  def calories_female  # calcula cuantas calorias debe quemar una mujer

    tmb = (10*User.find(self.user_id).weight)+(6.25*User.find(self.user_id).height)-(5*years_calculate)-161

    tmb_activo = tmb*0.50
    tmb = tmb + tmb_activo
    tmb_digestion = tmb*0.10
    tmb = tmb + tmb_digestion
    if User.find(self.user_id).weight - weight_all > 0
      return tmb = tmb + 500
    else
      return tmb
    end
  end

  def years_calculate  # calcula la edad del usuario
    year1 = Time.diff(User.find(self.user_id).birthdate, Time.now)
    return year1[:year]
  end
  def heart_rate
  	edad=User.find(self.user_id).age
  	hrr=0
  	if (edad<=20)
  		hrr=135
  	elsif(edad>=21 && edad<=30 )
  		hrr=129
  	elsif(edad>=31 && edad<=35 )
  		hrr=125
  	elsif(edad>=36 && edad<=40 )
  		hrr=122
  	elsif(edad>=41 && edad<=45 )
  		hrr=119
  	elsif(edad>=46 && edad<=50 )
  		hrr=115
  	elsif(edad>=51 && edad<=55 )
  		hrr=112
  	elsif(edad>=56 && edad<=60 )
  		hrr=108
  	elsif(edad>=61 && edad<=69 )
  		hrr=105
  	else(edad>=70)
  		hrr=102
  	end
  end

end

