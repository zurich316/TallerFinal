# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

band_types = [{name: 'Microsoft Band' , path: '/assets/microsoft_icon.png'},{name: 'FitBit Charge HR' , path: '/assets/fitbit_icon.jpg'}]

band_types.each do |brand|
  BandType.create( name: brand[:name], path: brand[:path])
end