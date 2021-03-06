require_relative( '../db/sql_runner' )
require_relative( '../models/city')

class Country

  attr_accessor( :name )
  attr_reader( :id )

  def initialize( options )
    @id = options['id'].to_i if options['id']
    @name = options['name']
  end

  #CREATE

  def save()
    sql = "INSERT INTO countries(name)
           VALUES($1)
           RETURNING id"
    values = [@name]
    results = SqlRunner.run(sql, values)
    @id = results.first()['id'].to_i
  end

  #READ

  def self.all()
    sql = "SELECT * FROM countries"
    country_data = SqlRunner.run(sql)
    return Country.map_items(country_data)
  end

  def cities()
    sql = "SELECT * FROM cities
           WHERE cities.country_id = $1"
    values = [@id]
    city_data = SqlRunner.run(sql, values)
    cities = City.map_items(city_data)
    return cities
  end

  def self.find(id)
    sql = "SELECT * FROM countries
           WHERE id = $1"
    values = [id]
    results = SqlRunner.run(sql, values)
    return Country.new(results.first)
  end

  # UPDATE

  def update()
    sql = "UPDATE countries
           SET name = $1
           WHERE id = $2"
    values = [@name, @id]
    SqlRunner.run(sql, values)
  end

  #DELETE

  def self.delete_all()
    sql = "DELETE FROM countries"
    SqlRunner.run(sql)
  end

  def delete()
    sql = "DELETE FROM countries
           WHERE id = $1"
    values = [@id]
    SqlRunner.run(sql, values)
  end

  def self.delete(id)
    sql = "DELETE FROM countries
    WHERE id = $1"
    values = [id]
    SqlRunner.run( sql, values )
  end

  # HELPER

  def self.map_items(country_data)
    result = country_data.map { |country| Country.new( country ) }
    return result
  end
end
