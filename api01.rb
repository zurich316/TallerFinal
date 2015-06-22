require 'mechanize'
require 'logger'
require 'pusher'
require 'cgi'

agent = Mechanize.new
agent.log = Logger.new 'mechanize.log'
puts 'Please enter your FiTrack username'
user= gets.chomp
puts 'Please enter your FiTrack password'
psw = gets.chomp
#Log in con la cuenta user and psw
agent.add_auth('http://fitrackucb.herokuapp.com',user,psw)


Pusher.url = "http://90b3bfd4d3713a081765:def286f353288afd72b7@api.pusherapp.com/apps/126255"
channel='test_channel1'
message = CGI.escape_html 'Please, associate a band to see your fitness work'
Pusher[channel].trigger('new_notification', {
  message: message
})

bands = JSON.parse agent.get('http://fitrackucb.herokuapp.com/bands.json').body
if bands.size == 1
flag=0
	while flag<=180 do	
		steps=Random.new.rand(0..100)
		calories=Random.new.rand(0..50)
		long=Random.new.rand(-17.399343..-17.366742)
		lat=Random.new.rand(-66.180571..-66.136969)
		hr = Random.new.rand(60..250)
		date=Time.now
		user_id=agent.get('http://fitrackucb.herokuapp.com/band_informations/new').form_with(:method => 'POST').field_with(:name => 'band_information[user_id]').value
		band_id=agent.get('http://fitrackucb.herokuapp.com/band_informations/new').form_with(:method => 'POST').field_with(:name => 'band_information[band_id]').value
		#Asociamos los datos de la banda a la cuenta de usuario 1 (sergio@fitrack.com) y a su banda asociada con id 1.
		data = {'band_information[long]'=>long,'band_information[lat]'=>lat,'band_information[calories]'=>calories,'band_information[steps]'=>steps,'band_information[registered_date]'=>date, 'band_information[heart_rate]'=>hr,'band_information[user_id]'=>user_id,'band_information[band_id]'=>band_id}
		agent.post('http://fitrackucb.herokuapp.com/band_informations.json', data) do |page|
		   puts page.body
		end
		puts flag
		flag+=1
		sleep(60)
	end
else
	message = {:channel => '/messages/new', :data => 'Please, associate a band to register data in the app.'}  
    uri = URI.parse("http://localhost:9292/faye")  
    Net::HTTP.post_form(uri ,:message => message.to_json)
end
	