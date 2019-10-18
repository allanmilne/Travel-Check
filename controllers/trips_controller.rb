require( 'sinatra' )
require( 'sinatra/contrib/all' ) if development?
require('rubygems')
require('bundler/setup')

also_reload('../models/*')

require_relative( '../models/city' )
require_relative( '../models/country' )
require_relative( '../models/trip' )

# display all trips
get "/trips" do
  @trips = Trip.all()
  erb :"trips/index"
end

# create new trip form
get "/trips/new" do
  @cities = City.all()
  erb :"trips/new"
end

# edit trip form
get "/trips/:id/edit" do
  @trip = Trip.find(params['id'])
  @city = City.find(@trip.city_id)
  @cities = City.all()
  erb :"trips/edit"
end

# delete trip
get "/trips/:id/delete" do
  @trip = Trip.find(params['id'])
  @trip.delete
  erb :"trips/delete"
end

# show city details
get "/trips/:id" do
  @trip = Trip.find(params['id'])
  erb :"trips/show"
end

# save trip to db
post "/trips" do
  @trip = Trip.new(params)
  @trip.save
  redirect to '/trips'
end

# update trip db entry
post "/trips/:id" do
  @trip = Trip.new(params)
  @trip.update
  redirect to "/trips"
end
