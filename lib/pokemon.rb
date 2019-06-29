require "pry"

class Pokemon
	attr_accessor :id, :name, :type, :db

	def initialize(name)
		@name = name
		#@type = type
		#@db = db
	end

	def self.save(name, type, db)
		#ins = db.execute("INSERT INTO pokemon (name) (type) VALUES (?, ?)", [name, type]))
		db.execute( "INSERT INTO pokemon ( name, type) VALUES ( ?, ? )", [name, type])
	end

	def self.find(id, db)
		#@type = "HODOR"
		blah = db.execute("SELECT * FROM pokemon WHERE id = (?)", [id])
		temp = Pokemon.new(blah[0][1])
		temp.id = blah[0][0]
		temp.type = blah[0][2]
		temp
		#binding.pry
	end


end

