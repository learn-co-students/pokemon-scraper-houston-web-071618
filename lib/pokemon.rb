require "pry"
class Pokemon

  attr_accessor :id, :name, :type, :db, :hp

  def initialize(id:id, name:name, type:type, db:db, hp:hp=(nil))
    @id = id
    @name =name
    @type =type
    @db = db
    @hp= hp
  end

  def self.save (pokemon, type, db)
    sql = <<-SQL
      INSERT INTO pokemon (name, type)
      VALUES (?, ?)
    SQL

    db.execute(sql, pokemon, type)
  end

  def self.find (id, db)
    sql = <<-SQL
      SELECT * FROM pokemon WHERE id = ?
    SQL

    pokemon = db.execute(sql, id)
    # binding.pry
    pokemon = pokemon.first
    pokemon_id = pokemon[0]
    pokemon_name = pokemon[1]
    pokemon_type = pokemon[2]
    Pokemon.new(id:pokemon_id, name:pokemon_name, type:pokemon_type, db:db, hp:60)

  end
end
