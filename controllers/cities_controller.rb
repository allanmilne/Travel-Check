require( 'sinatra' )
require( 'sinatra/contrib/all' )
require('pry')
require_relative( '../models/city' )
require_relative( '../models/country' )
also_reload( '../models/*' )

# display all cities
get "/cities" do
  @cities = City.all()
  erb :"cities/index"
end

# create new city form
get "/cities/new" do
  @countries = Country.all()
  erb :"cities/new"
end

# show city details
get "/cities/:id" do
  @city = City.find(params['id'])
  erb :"cities/show"
end

# # edit city form
# get "/cities/:id/edit" do
#   @city = City.find(params['id'])
#   erb :"cities/edit"
# end

# save city to db
post "/cities" do
binding.pry
  @city = City.new(params)
  @city.save
  redirect to '/cities'
end
