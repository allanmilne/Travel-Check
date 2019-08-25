require_relative( '../db/sql_runner' )

class Trip

  attr_reader(:id)
  attr_accessor(:city_id, :visited)

  def initialize( options )
    @id = options['id'].to_i if options['id']
    @city_id = options['city_id'].to_i
    @visited = options['visited']
  end

  def save()
    sql = "INSERT INTO trips (city_id, visited)
           VALUES ($1, $2)
           RETURNING id"
    values = [@city_id, @visited]
    results = SqlRunner.run(sql, values)
    @id = results.first()['id'].to_i
  end

  def update()
  sql = "UPDATE trips
        SET (city_id, visited) = ($1, $2)
        WHERE id = $3"
  values = [@city_id, @visited, @id]
  SqlRunner.run( sql, values )
  end

  def delete()
    sql = "DELETE FROM trips WHERE id = $1"
    values = [@id]
    SqlRunner.run(sql, values)
  end

  def self.all()
    sql = "SELECT * FROM trips"
    trip_data = SqlRunner.sql(sql)
    return Trip.map_items(trip_data)
  end

  def self.delete_all()
    sql = "DELETE FROM trips"
    SqlRunner.run(sql)
  end

  # Helper methods for mapping
  def self.map_items(trip_data)
    result = trip_data.map { |trip| Trip.new(trip) }
    return result
  end
end
