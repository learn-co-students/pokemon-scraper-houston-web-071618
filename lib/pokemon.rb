#responsible for saving, adding, removing, or changing anything about each Pokémon
require 'pry'
class Pokemon
attr_accessor :id, :name, :type, :db

def initialize (id:, name:, type:, db:nil)
  @id= id
  @name= name
  @type= type
  @db = db
end

def self.save(name, type, db)
  #saves an instance of a pokemon with the correct id
  sql = <<-SQL
  -- select * FROM pokemon;
  INSERT INTO pokemon (name, type) VALUES (?, ?);
  SQL
  db.execute sql, name,type
#  binding.pry
end

def self.find (id, db)
  #creates a new Pokemon after selecting their row from the database by their id number
  sql = <<-SQL
  SELECT * FROM pokemon
  WHERE id = ?;
  SQL
  #binding.pry
  find_pokemon = db.execute(sql, id).flatten
  pokemon_object = Pokemon.new(id: find_pokemon[0], name: find_pokemon[1], type: find_pokemon[2])
end

# def alter_hp
# end

end
