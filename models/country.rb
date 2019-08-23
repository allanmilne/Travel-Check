require_relative( '../db/sql_runner' )

class Country

  attr_reader(:id, :name)

  def initialize( options )
    @id = options['id'].to_i if options['id']
    @name = options['name']
  end

  def save()
    sql = "INSERT into countries(name)VALUES($1)RETURNING id"
    values = [@name]
    results = SqlRunner.run(sql, values)
    @id = results.first()['id'].to_i
  end

  def self.all()
    sql = "SELECT * FROM countries"
    result = SqlRunner.run(sql)
    return result.map { | country | Country.new(country) }
  end

end
