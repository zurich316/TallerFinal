require 'mechanize'
require 'logger'

@website = 'localhost:3000'

agent = Mechanize.new
agent.log = Logger.new 'mechanize.log'
#Log in con la cuenta sergio@fitrack.com y password: 12345678
agent.add_auth('http://localhost:3000','jeyson.mirabal@gmail.com','12345678')
#agent.add_auth('http://localhost:3000','sergio@fitrack.com','12345678')

flag=0
while flag<=180 do	
	steps=Random.new.rand(0..100)
	calories=Random.new.rand(0..50)
	long=Random.new.rand(-17.399343..-17.366742)
	lat=Random.new.rand(-66.180571..-66.136969)
	#Asociamos los datos de la banda a la cuenta de usuario 1 (sergio@fitrack.com) y a su banda asociada con id 1.
	data = {'band_information[long]'=>long,'band_information[lat]'=>lat,'band_information[calories]'=>calories,'band_information[steps]'=>steps,'band_information[registered-date]'=>Time.now,'band_information[user_id]'=>'1','band_information[band_id]'=>'1'}
	agent.post('http://localhost:3000/band_informations.json', data) do |page|
	   puts page.body
	end
	puts flag
	flag+=1
	sleep(60)
end