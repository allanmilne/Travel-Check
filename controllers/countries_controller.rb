require( 'sinatra' )
require( 'sinatra/contrib/all' )
require_relative( '../models/country' )
also_reload( '../models/*' )

get '/' do
  @countries = Country.all()
  erb( :"countries/index" )
end
