require_relative( '../db/sql_runner' )

class Trip

  attr_reader(:id, :city_id, :visited)

  def initialize( options )
    @id = options['id'].to_i if options['id']
    @city_id = options['city_id'].to_i
    @visited = options['visited']
  end




end
