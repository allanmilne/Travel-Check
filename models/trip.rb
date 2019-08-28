class Trip
attr_reader(:id)
attr_accessor(:name, :visited, :country_id, :city_id)

def initialize(options)
  @name = options['name']
  @visited = options['visited']
  @country_id = options['country_id'].to_i
  @city_id = options['city_id'].to_i
  @id ||= options['id'].to_i
end

def save()
  sql = "INSERT INTO trips (name, visited, country_id, city_id)
         VALUES ($1, $2, $3, $4)
         RETURNING id;"
  values = [@name,@visited, @country_id, @city_id]
  results = SqlRunner.run(sql, values)
  @id = results.first()['id'].to_i
end

def update()
  sql = "UPDATE trips
      SET (name, visited, country_id, city_id) = ($1, $2, $3, $4)
      WHERE id = $5"
  values = [@name, @visited, @country_id, @city_id, @id]
  SqlRunner.run( sql, values )
end

def delete()
  sql = "DELETE FROM trips WHERE id = $1"
  values = [@id]
  SqlRunner.run(sql, values)
end

def self.all()
  sql = "SELECT * FROM trips"
  city_data = SqlRunner.run(sql)
  return Trip.map_items(city_data)
end

def self.delete_all()
  sql = "DELETE FROM trips"
  SqlRunner.run(sql)
end

def self.find(id)
  sql = "SELECT * FROM trips
         WHERE id = $1"
  values = [id]
  results = SqlRunner.run(sql, values)
  return Trip.new(results.first)
end

def self.map_items(trip_data)
  result = trip_data.map { |trip| Trip.new(trip) }
  return result
end

end
