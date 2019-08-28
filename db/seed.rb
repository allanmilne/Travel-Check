require_relative( "../models/country.rb" )
require_relative( "../models/city.rb" )
require_relative( "../models/trip.rb" )
require("pry-byebug")

system('psql -d travel_bucket_list -f db/travel_bucket_list.sql') # Recreates the db tables but must be run from project dir.

country1 = Country.new("name" => "China")
country2 = Country.new("name" => "Scotland")
country3 = Country.new("name" => "France")
city1 = City.new(
  "name" => "Shanghai",
  "country_id" => 1)
city2 = City.new(
  "name" => "Edinburgh",
  "country_id" => 2)
city3 = City.new(
  "name" => "Paris",
  "country_id" => 3)
trip1 = Trip.new(
  'name' => 'Stag-do',
  'visited' => true,
  'country_id' => 1,
  'city_id' => 1)
trip2 = Trip.new(
  'name' => 'Honeymoon',
  'visited' => false,
  'country_id' => 2,
  'city_id' => 2)
trip3 = Trip.new(
  'name' => 'Weekend at Bernies',
  'visited' => true,
  'country_id' => 3,
  'city_id' => 3)

country1.save
country2.save
country3.save
city1.save
city2.save
city3.save
trip1.save
trip2.save
trip3.save

binding.pry
nil
