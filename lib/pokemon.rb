require 'pry'
class Pokemon

  attr_reader :name, :type, :db, :id

  # attr_accessor :hp

  def initialize(pokemon_obj)

    @name = pokemon_obj[:name]
    @type = pokemon_obj[:type]
    @db = pokemon_obj[:db]
    @id = pokemon_obj[:id]
    # @hp = 60
  end

  def self.save(pk_name, pk_type, db)

    sql_save = <<-SQL
      INSERT INTO pokemon (name, type) VALUES (?, ?);
      SQL

      db.execute(sql_save, pk_name, pk_type)
  end

  def self.find(pokemon_id, db)
    sql = <<-SQL
      SELECT name, type FROM pokemon WHERE id = ?;
      SQL

      results = db.execute(sql, pokemon_id).flatten

      new_pokemon_obj = {
        name: results[0],
        type: results[1],
        db: db,
        id: pokemon_id
      }

      Pokemon.new(new_pokemon_obj)
  end

  # def alter_hp(new_hp, db)
  #   #update self.hp
  #   #push new hp to db
  #   update_record = <<-SQL
  #     UPDATE pokemon SET hp = ? WHERE id = ?
  #   SQL
  #
  #
  #   db.execute(update_record, new_hp, self.id)
  #
  # end
end
