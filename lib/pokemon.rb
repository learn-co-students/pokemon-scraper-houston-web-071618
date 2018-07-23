require 'pry'
require 'SQLite3'


class Pokemon

  db = SQLite3::Database.new('pokemon.db')


  attr_accessor :name, :type, :id, :db, :hp


  def initialize(db:, id:, name:, type:, hp: nil)
      @db = db
      @id = id
      @name = name
      @type = type
      @hp = hp

  end

  def self.save(name, type, db) #Pokemon.save('pika', electric, db)
    sql = <<-SQL
      INSERT INTO pokemon (name, type) VALUES (?, ?)
    SQL
    db.execute(sql, name, type)
  end

  def self.find(id_num, db)
    sql = <<-SQL
        SELECT * FROM pokemon WHERE id = ?
    SQL
    results = db.execute(sql, id_num).flatten
    Pokemon.new(db: db, id:results[0], name: results[1], type:results[2], hp: results[3])
      # results [1, "Pikachu", "electric"]
  end

# bonus
  def alter_hp(hp, db)
    sql = <<-SQL
       UPDATE pokemon SET hp=(?) where id = (?)
    SQL
    db.execute(sql, hp, id)
  end

end
