require "pry"
require "sqlite3"

class Pokemon

	db = SQLite3::Database.new("pokemon.db")

	# @@id = 1
	attr_accessor :name, :type, :db, :id, :hp

	def initialize(db:, id:, name:, type:, hp: nil)
		@name = name
		@type = type
		@id = id
		@db = db
		@hp = hp
	end

	def self.save(name, type, db)
		sql = <<-SQL 
			INSERT INTO pokemon (name, type) VALUES (?, ?)
		SQL
			db.execute(sql, name, type)
	end

	def self.find(id, db)
		sql = <<-SQL
			SELECT * FROM pokemon WHERE id = ?

		SQL
		results = db.execute(sql, id).flatten
		Pokemon.new(db: db, id: results[0], name: results[1], type: results[2], hp: results[3])
	end

	def alter_hp(hp, db)
		sql = <<-SQL
		UPDATE pokemon SET hp = (?) WHERE id = (?)
		SQL
			db.execute(sql, hp, id)
	end


end
