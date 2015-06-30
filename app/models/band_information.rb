#Manage information sent from band
class BandInformation < ActiveRecord::Base
  belongs_to :user
  belongs_to :band
  validates :steps, :lat,:long,:calories,:heart_rate , presence: true
  before_save :heart_rate_high

  def alarma?
  	edad=User.find(self.user_id).age
  	if (edad<=20 && self.heart_rate>200)
  		true
  	elsif(edad>=21 && edad<=30 && self.heart_rate>190)
  		true
  	elsif(edad>=31 && edad<=35 && self.heart_rate>185)
  		true
  	elsif(edad>=36 && edad<=40 && self.heart_rate>180)
  		true
  	elsif(edad>=41 && edad<=45 && self.heart_rate>175)
  		true
  	elsif(edad>=46 && edad<=50 && self.heart_rate>170)
  		true
  	elsif(edad>=51 && edad<=55 && self.heart_rate>165)
  		true
  	elsif(edad>=56 && edad<=60 && self.heart_rate>160)
  		true
  	elsif(edad>=61 && edad<=69 && self.heart_rate>155)
  		true
  	elsif(edad>=70 && self.heart_rate>150)
  		true
  	else
  		false
  	end
  end

  def heart_rate_high
  	if alarma?
  		Pusher.url = "http://90b3bfd4d3713a081765:def286f353288afd72b7@api.pusherapp.com/apps/126255"
		channel='test_channel'+self.user_id.to_s
		message = CGI.escape_html 'Your heart rate is too high.'
		Pusher[channel].trigger('heart', {
		  message: message, titulo: 'HEART RATE ALARM ('+self.heart_rate.to_s+' BPM)'
		})
  	end
  end
end
