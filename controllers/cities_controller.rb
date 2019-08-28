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

# edit city form
get "/cities/:id/edit" do
  @city = City.find(params['id'])
  @countries = Country.all()
  erb :"cities/edit"
end

# delete city
get "/cities/:id/delete" do
  @city = City.find(params['id'])
  @city.delete
  erb :"cities/delete"
end

# show city details
get "/cities/:id" do
  @city = City.find(params['id'])
  erb :"cities/show"
end

# save city to db
post "/cities" do
  @city = City.new(params)
  @city.save
  redirect to '/cities'
end

# update city db entry
post "/cities/:id" do
  @city = City.new(params)
  @city.update
  redirect to "/cities"
end
