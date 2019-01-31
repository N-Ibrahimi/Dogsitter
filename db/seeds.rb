require 'faker'
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
puts `clear`
puts "    ################################################################"
puts "    ######## ~ L'ancienne base de donnée va être supprimée~ ########"
puts ""
puts "    ----------------------------------------------------------------"

Dog.destroy_all
ActiveRecord::Base.connection.execute("DELETE from sqlite_sequence where name = 'dogs'")
Dogsitter.destroy_all
ActiveRecord::Base.connection.execute("DELETE from sqlite_sequence where name = 'dogsitters'")
Stroll.destroy_all
ActiveRecord::Base.connection.execute("DELETE from sqlite_sequence where name = 'strolls'")
City.destroy_all
ActiveRecord::Base.connection.execute("DELETE from sqlite_sequence where name = 'cities'")


City.create(city_name: "Paris")
City.create(city_name: "Bordeaux")
City.create(city_name: "Caen")
puts ""
puts ""
puts "                                    👽 👽  👽 "

puts "    ##############################################################################"
puts "    ######## ~                       DOGS NAMES                          ~ ########"
puts ""
puts "    ------------------------------------------------------------------------------"
puts ""
puts ""

10.times do |x|
  dog = Dog.create(name: Faker::Name.first_name, city_id: rand(1..3))
  puts "Dog : #{dog.name} | the city_id is #{dog.city_id}"
end 
puts ""
puts ""

puts "    ##############################################################################"
puts "    ######## ~                   DOOGSITTERS NAMES                     ~ ########"
puts ""
puts "    ------------------------------------------------------------------------------"
puts ""
puts ""

10.times do |x|
  sitter = Dogsitter.create(first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, city_id: rand(1..3))
  puts "Dogsitter : #{sitter.first_name} | #{sitter.last_name} | city_id #{sitter.city_id}"
end 
puts ""
puts ""

puts "    ##############################################################################"
puts "    ######## ~                   DOOGSITTERS NAMES                     ~ ########"
puts ""
puts "    ------------------------------------------------------------------------------"
puts ""
puts ""
10.times do |x|
  stroll = Stroll.create(dogsitter_id: rand(1..x), dog_id: rand(1..x))
	puts "Stroll : #{stroll.dogsitter_id} | Dog_id is #{stroll.dog_id}"

end
puts ""
puts ""
puts "              ############🥰 🥰 🥰 🥰 🥰 🥰 🥰 🥰 🥰 🥰 🥰 🥰 🥰 ###########"
puts "              ####### ~ Merci pour ta patience ! ~ ###########"
puts "              ############🥰 🥰 🥰 🥰 🥰 🥰 🥰 🥰 🥰 🥰 🥰 🥰 🥰 ###########"