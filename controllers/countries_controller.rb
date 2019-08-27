require( 'sinatra' )
require( 'sinatra/contrib/all' )
require_relative( '../models/country' )
also_reload( '../models/*' )

# homepage
get '/index' do
  @countries = Country.all()
  erb :"countries/index"
end

# create new country
get "/new" do
  erb :"countries/new"
end

# show cities in a country
get "/countries/:id" do
  @country = Country.find(params['id'])
  erb :"countries/show"
end

# edit a country


# delete a country
