require 'sqlite3'

class Pokemon

    attr_accessor :id, :name, :type, :db

    def initialize(name:, id:, type:, db:)
      @id = id
      @name = name
      @type = type
      @db = db
    end

    def self.save(name,type,db)
      sql = <<-SQL
        INSERT INTO pokemon (name, type) VALUES (?, ?)
      SQL
      db.execute(sql, name, type)
    end


    def self.find(id,db)
        sql = <<-SQL
          SELECT * FROM pokemon WHERE id = ?
        SQL
        pokemon_array = db.execute(sql,id).flatten
        Pokemon.new(id:pokemon_array[0], name:pokemon_array[1], type:pokemon_array[2], db:pokemon_array)
    end
end
