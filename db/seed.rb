require_relative( "../models/country.rb" )
require_relative( "../models/city.rb" )
require_relative( "../models/trip.rb" )

system('psql -d travel_bucket_list -f db/travel_bucket_list.sql') # Recreates the db tables but must be run from project dir.

country1 = Country.new("name" => "China")
country2 = Country.new("name" => "Brazil")
country3 = Country.new("name" => "Netherlands")
country4 = Country.new("name" => "United State of America")
country5 = Country.new("name" => "Morocco")
country6 = Country.new("name" => "Australia")

city1 = City.new(
  "name" => "Shanghai",
  "country_id" => 1)
city2 = City.new(
  "name" => "Beijing",
  "country_id" => 1)
city3 = City.new(
  "name" => "São Paulo",
  "country_id" => 2)
city4 = City.new(
  "name" => "Rio de Janeiro",
  "country_id" => 2)
city5 = City.new(
  "name" => "Amsterdam",
  "country_id" => 3)
city6 = City.new(
  "name" => "New York",
  "country_id" => 4)
city7 = City.new(
  "name" => "Las Vegas",
  "country_id" => 4)
city8 = City.new(
  "name" => "Marrakesh",
  "country_id" => 5)
city9 = City.new(
  "name" => "Melbourne",
  "country_id" => 6)

trip1 = Trip.new(
  'name' => 'Stag-do',
  'visited' => true,
  'country_id' => 3,
  'city_id' => 5)
trip2 = Trip.new(
  'name' => 'Honeymoon',
  'visited' => false,
  'country_id' => 4,
  'city_id' => 6)
trip3 = Trip.new(
  'name' => 'Weekend at Bernies',
  'visited' => true,
  'country_id' => 2,
  'city_id' => 4)
trip4 = Trip.new(
  'name' => 'Family holiday',
  'visited' => false,
  'country_id' => 4,
  'city_id' => 4)

country1.save
country2.save
country3.save
country4.save
country5.save
country6.save
city1.save
city2.save
city3.save
city4.save
city5.save
city6.save
city7.save
city8.save
city9.save
trip1.save
trip2.save
trip3.save
trip4.save
