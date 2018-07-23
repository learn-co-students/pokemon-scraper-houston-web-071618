require 'pry'

class Pokemon

	attr_reader :info, :id, :name, :type, :db

	def initialize(info)
		@info = info
		@id = info[:id]
		@name = info[:name]
		@type = info[:type]
		@db = info[:db]
	end

	def self.save(name, type, db)
		sql = <<-SQL
			INSERT INTO pokemon (name,type) values (?,?);
		SQL
		db.execute(sql, name, type)
	end

	def self.find(id, db)
		sql = <<-SQL
			SELECT * FROM pokemon id where id = ?;
		SQL

		found = db.execute(sql, id).flatten

		id = found[0]
		name = found[1]
		type = found[2]

		Pokemon.new(id: id, name: name, type: type)
		
	end

end
