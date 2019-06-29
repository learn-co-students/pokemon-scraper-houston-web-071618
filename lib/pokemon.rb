require "pry"

class Pokemon
  attr_reader :name
  attr_accessor :type, :db, :id
  #using colons allows you to rely on the name to match it up.
  #the colon means that the argument is passed in by key rather than by position.
  def initialize(name)
    @name = name
  end

  # def function(name:'hh', key:)
  # end

  # function(name: 'Joshua', key: 1)

  #.execute is a ruby method to put SQL code inside a ruby document.
  def self.save(name, type, db)
    sql = <<-SQL
    INSERT INTO pokemon (name, type) VALUES (?, ?)
    SQL
    db.execute(sql, name, type)

    #   db.execute("INSERT INTO pokemon (name, type) VALUES (?, ?)", name, type)
  end

  def self.find(id_num, db)
    #    pokemon_info = db.execute("SELECT * FROM pokemon WHERE id=?", id_num).flatten
    sql = <<-SQL
    SELECT * FROM pokemon WHERE id = ?
    SQL
    pokemon_info = db.execute(sql, id_num)
    flattened_pokemon = pokemon_info.flatten
    pokemon_object = Pokemon.new(flattened_pokemon[1])
    pokemon_object.type = flattened_pokemon[2]
    pokemon_object.id = flattened_pokemon[0]
    pokemon_object
  end
end
