require_relative( "../models/country.rb" )
require_relative( "../models/city.rb" )
require("pry-byebug")

City.delete_all()
Country.delete_all()

country1 = Country.new({"name" => "China"})
country1.save()
country2 = Country.new({"name" => "Brazil"})
country2.save

city1 = City.new({
  "name" => "Shanghai",
  "country_id" => country1.id,
  "visited" => true
})
city1.save
city2 = City.new({
  "name" => "Beijing",
  "country_id" => country1.id,
  "visited" => false
})
city2.save
city3 = City.new({
  "name" => "Rio de Janeiro",
  "country_id" => country2.id,
  "visited" => true})
city3.save

binding.pry
nil
