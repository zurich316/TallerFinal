require 'mechanize'
require 'logger'

@website = 'localhost:3000'

agent = Mechanize.new
agent.log = Logger.new 'mechanize.log'

agent.add_auth('http://localhost:3000','sergio@fitrack.com','12345678')

data = {'band_information[steps]'=>'1000','band_information[user_id]'=>'1','band_information[band_id]'=>'2'}
agent.post('http://localhost:3000/band_informations.json', data) do |page|
   puts page.body
end

