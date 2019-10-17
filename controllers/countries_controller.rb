require( 'sinatra' )
require( 'sinatra/contrib/all' ) if development?
require_relative( '../models/country' )
require_relative( '../models/city' )

# display all countries
get '/countries' do
  @countries = Country.all()
  erb :"countries/index"
end

# create new country form
get "/countries/new" do
  erb :"countries/new"
end

# edit country form
get "/countries/:id/edit" do
  @country = Country.find(params['id'])
  erb :"countries/edit"
end

# delete country
get "/countries/:id/delete" do
  @country = Country.find(params['id'])
  @country.delete
  erb :"countries/delete"
end

# show country details
get "/countries/:id" do
  @country = Country.find(params['id'])
  erb :"countries/show"
end

# save country to db
post "/countries" do
  @country = Country.new(params)
  @country.save
  redirect to '/countries'
end

# update country db entry
post "/countries/:id" do
  @country = Country.new(params)
  @country.update
  redirect to "/countries"
end