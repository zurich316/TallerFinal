require 'rubygems'
require 'mechanize'


inf = {"band_infos[steps]" => "123", "band_infos[calories]" => "122", "band_infos[lat]" => "34", "band_infos[long]" => "32"}

	agent = Mechanize.new
	agent.post('http://localhost:3000/band_infos', inf)
	result = JSON.parse agent
	puts result



inf2 = {"band[code]" => "121212121212"}

	agent = Mechanize.new
	agent.get('http://localhost:3000/bands')
	agent.page.links_with(:text => "Edit")
	agent.post('http://localhost:3000/bands/{.id}/edit',)
	result = JSON.parse agent
	puts result
