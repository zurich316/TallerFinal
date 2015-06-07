require 'mechanize'
require 'logger'

@website = 'localhost:3000'

agent = Mechanize.new
agent.log = Logger.new 'mechanize.log'

agent.add_auth('http://localhost:3000','sergio@fitrack.com','12345678')

flag=0
while flag<=180 do	
	steps=Random.new.rand(0..30)
	calories=Random.new.rand(0..15)
	long=Random.new.rand(-17.399343..-17.366742)
	lat=Random.new.rand(-66.180571..-66.136969)
	data = {'band_information[long]'=>long,'band_information[lat]'=>lat,'band_information[calories]'=>calories,'band_information[steps]'=>steps,'band_information[user_id]'=>'1','band_information[band_id]'=>'1'}
	agent.post('http://localhost:3000/band_informations.json', data) do |page|
	   puts page.body
	end
	puts flag
	flag+=1
	sleep(60)
end