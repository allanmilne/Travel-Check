require( 'sinatra' )
require( 'sinatra/contrib/all' )
require_relative( '../models/city' )
also_reload( '../models/*' )

# display all cities
get "/cities" do
  @cities = City.all()
  erb :"cities/index"
end

# create new city form
get "/cities/new" do
  erb :"cities/new"
end

# show city details
get "/cities/:id" do
  @city = City.find(params['id'])
  erb :"cities/show"
end

# # edit country form
# get "/cities/:id/edit" do
#   @city = City.find(params['id'])
#   erb :"cities/edit"
# end

# save city to db
post "/cities" do
  @city = City.new(params)
  @city.save
  redirect to '/cities'
end
