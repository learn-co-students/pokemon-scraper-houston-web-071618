require 'pry'
require 'nokogiri'
require 'open-uri'


class Pokemon


  attr_accessor :id, :name, :type, :db

  #@@id = []

  def initialize(id:, name:, type:, db:)
    @name = name
    @type = type
    @db = db
    @id = id
    #@@id << self
    # binding.pry
  end

  def self.save(name, type, db) # Pokemon.save('Pikachi', 'electric', db)
    sql = <<-SQL
      INSERT INTO pokemon (name, type) VALUES (?, ?)
    SQL
      db.execute(sql, name, type)
  end

  def self.find(id,db)
    #find returns a pokemon object by looking it up using its id

    sql = <<-SQL
      SELECT * FROM pokemon WHERE id = ?
    SQL


    returnArray = db.execute(sql, id).flatten
    #binding.pry
    Pokemon.new(id: returnArray[0], name: returnArray[1],type: returnArray[2], db:db)
    #returnArray = [[1, "pikachu", "electric"]]
    #how do we get this data out into a form we can use?
    #save(returnArray.first, returnArray.last, db)

    #binding.pry
  end

end
