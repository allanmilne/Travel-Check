require( 'sinatra' )
require( 'sinatra/contrib/all' )
require_relative('controllers/countries_controller')
# require_relative('controllers/')
# require_relative('controllers/')


get "/" do
  erb :"/countries/welcome"
end
