class User < ActiveRecord::Base
  	rolify
	has_many :goals 
	has_many :bands   
  	# Include default devise modules. Others available are:
  	# :confirmable, :lockable, :timeoutable and :omniauthable
  	devise :database_authenticatable, :registerable,
           :recoverable, :rememberable, :trackable, :validatable, :lockable
    before_create :role_user

    def role_user
    	if self.email == 'admin@fitrack.com'
    		self.add_role :admin
    	else
    		self.add_role :user
    	end
    end
end
