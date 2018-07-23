class Pokemon
  attr_accessor :id, :name, :type, :db

  def initialize(name)
    @name = name
    @type = type
    @db = db
  end

  def self.save(name, type, db)
    db.execute('INSERT INTO pokemon (name, type) VALUES (?, ?)', [name, type])
  end

  def self.find(id, db)
    var = db.execute('SELECT * FROM pokemon WHERE (?)', [id])
    new = Pokemon.new(var[0][1])
    new.type = var[0][2]
    new.id = var[0][0]
    new
  end
end
