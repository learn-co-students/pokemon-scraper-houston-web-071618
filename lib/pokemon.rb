class Pokemon

  attr_reader :name
  attr_accessor :type, :db, :id

  def initialize(name)
    @name = name
  end

  def self.save(name, type, db)
    sql = <<-SQL
      INSERT INTO pokemon (name , type) VALUES (?, ?)
    SQL
    db.execute(sql, name, type)
  end

  def self.find(id_num, db)
    sql = <<-SQL
    SELECT * FROM pokemon WHERE id=?
    SQL
    pokemon_info = db.execute(sql, id_num)
    pokemon_object = Pokemon.new(pokemon_info.flatten[1])
    pokemon_object.type = pokemon_info.flatten[2]
    pokemon_object.id = pokemon_info.flatten[0]
    pokemon_object
  end

end
