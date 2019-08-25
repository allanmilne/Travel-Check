require_relative( "../models/country.rb" )
require_relative( "../models/city.rb" )
require_relative( "../models/trip.rb" )
require("pry-byebug")

Trip.delete_all()
City.delete_all()
Country.delete_all()

country1 = Country.new({"name" => "China",})
country1.save()
country2 = Country.new({"name" => "Brazil"})
country2.save

city1 = City.new({"name" => "Shanghai", "country_id" => country1.id})
city1.save
city2 = City.new({"name" => "Beijing", "country_id" => country1.id})
city2.save
city3 = City.new({"name" => "Rio de Janeiro", "country_id" => country2.id})
city3.save

trip1 = Trip.new({"city_id" => city2.id, "visited" => true})
trip1.save
trip2 = Trip.new({"city_id" => city3.id, "visited" => false})
trip2.save
trip3 = Trip.new({"city_id" => city1.id, "visited" => false})
trip3.save

binding.pry
nil
