require 'pry'

class Pokemon
  attr_accessor :name, :type, :db, :id

  def initialize(id:, name:, type:, db: nil)
    # binding.pry
    @id = id
    @name = name
    @type = type
    @db = db
    # @hp = 60
  end

  def self.save(name, type, db)
    sql = <<-SQL
      INSERT INTO pokemon (name, type) VALUES (?, ?);
      -- SELECT * FROM pokemon;
    SQL
    db.execute sql, name, type

    # db.execute("SELECT * FROM pokemon")
    # binding.pry

  end

  def self.find(id, db)

    sql = <<-SQL
      SELECT * FROM pokemon
      WHERE id = ?
    SQL
    find_pokemon = db.execute(sql, id).flatten
    pokemon_object = Pokemon.new(id: find_pokemon[0], name: find_pokemon[1], type: find_pokemon[2])
    # binding.pry

  end

  # def alter_hp
  #
  # end
end
