require_relative( '../db/sql_runner' )

class City

  attr_reader( :id)
  attr_accessor( :name, :country_id)

  def initialize( options )
    @id = options['id'].to_i if options['id']
    @name = options['name']
    @country_id = options['country_id'].to_i
  end

  # CREATE

  def save()
    sql = "INSERT INTO cities (name, country_id)
           VALUES ($1, $2)
           RETURNING id"
    values = [@name, @country_id]
    results = SqlRunner.run(sql, values)
    @id = results.first()['id'].to_i
  end

  #READ

  def self.all()
    sql = "SELECT * FROM cities"
    city_data = SqlRunner.run(sql)
    return City.map_items(city_data)
  end

  def country
    sql ="SELECT * FROM countries WHERE id = $1"
    values = [@country_id]
    results = SqlRunner.run(sql, values)
    return Country.new(results.first)
  end

  def self.find(id)
    sql = "SELECT * FROM cities
           WHERE id = $1"
    values = [id]
    results = SqlRunner.run(sql, values)
    return City.new(results.first)
  end

  # UPDATE

  def update()
    sql = "UPDATE cities
        SET (name, country_id) = ($1, $2)
        WHERE id = $3"
    values = [@name, @country_id, @id]
    SqlRunner.run( sql, values )
  end

  # DELETE

  def self.delete_all()
    sql = "DELETE FROM cities"
    SqlRunner.run(sql)
  end

  def delete()
    sql = "DELETE FROM cities WHERE id = $1"
    values = [@id]
    SqlRunner.run(sql, values)
  end

  # HELPER
  
  def self.map_items(city_data)
    result = city_data.map { |city| City.new(city) }
    return result
  end

end
