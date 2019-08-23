require_relative( "../models/country.rb" )
require_relative( "../models/city.rb" )
require_relative( "../models/trip.rb" )
require("pry-byebug")

# Country.delete_all()
# City.delete_all()
# Trip.delete_all()

country1 = Country.new({
  "name" => "China",
})

country1.save()
