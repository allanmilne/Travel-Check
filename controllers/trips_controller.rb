require( 'sinatra' )
require( 'sinatra/contrib/all' )
require('pry')
require_relative( '../models/city' )
require_relative( '../models/country' )
require_relative( '../models/trip' )
also_reload( '../models/*' )

# display all trips
get "/trips" do
  @trips = Trip.all()
  erb :"trips/index"
end
