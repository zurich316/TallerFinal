class User < ActiveRecord::Base
  	rolify
  	has_many :goals 
  	has_many :bands
    has_many :band_informations
    has_many :fitness_sessions   
    has_many :dream_sessions
    has_many :alarms
  	# Include default devise modules. Others available are:
  	# :confirmable, :lockable, :timeoutable and :omniauthable
  	devise :database_authenticatable, :registerable,
           :recoverable, :rememberable, :trackable, :validatable, :lockable
    before_create :role_user
    validates :name, :last_name, :height, :weight, presence: true
    validate :valid_date?

  
  def future_date
    #Next verifies if a date is in the future
    unless self.birthdate < Time.now 
      errors.add(:birthdate, "is a future date")
    end
  end
 def too_young
  #Next verifies if the person is too young
    unless Time.diff(Time.now,self.birthdate)[:year]>5 
      errors.add(:birthdate, "is too soon. You're too young.")
    end
  end
  def valid_date?
    future_date
    too_young
  end 

  def role_user
    	if self.email.split('@')[1] == 'fitrack.com'
    		self.add_role :admin
    	else
    		self.add_role :user
    	end
  end

  def age
    Time.diff(Time.now,self.birthdate)[:year]
  end
end
