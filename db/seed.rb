require_relative( "../models/country.rb" )
require_relative( "../models/city.rb" )
require_relative( "../models/trip.rb" )
require("pry-byebug")

Country.delete_all()
# City.delete_all()
# Trip.delete_all()

country1 = Country.new({"name" => "China",})
country1.save()
country2 = Country.new({"name" => "Brazil"})
country2.save

# city1 = City.new({"name" => "Hong Kong", "country_id" => country1.id})
# city1.save
# city2 = City.new({"name" => "Rio de Janeiro", "country_id" => country2.id})
# city2.save

binding.pry
nil
