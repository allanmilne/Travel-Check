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
get '/new' do
  erb :"countries/new"
end

# edit a country


# delete a country


# show cities in a country
