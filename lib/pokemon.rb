class Pokemon

  attr_accessor :id, :name, :type, :hp, :db
  def initialize(id:, name:, type:, hp: nil, db:)
    @id = id
    @name = name
    @type = type
    @hp = hp
    @db = db
  end
  
  def self.save(name, type, db)
    sql = <<-SQL
      INSERT INTO pokemon (name, type) VALUES (?, ?)
    SQL
    db.execute(sql, name, type)
  end

  def self.find(id_num, db)
    sql = <<-SQL
      SELECT * FROM pokemon WHERE id=?
    SQL
    info = db.execute(sql, id_num).flatten
    new(id: info[0], name: info[1], type: info[2], hp: info[3], db: db)
  end


  def alter_hp(hp, db)
    sql = <<-SQL
      UPDATE pokemon SET hp = (?) WHERE id = (?)
    SQL
    db.execute(sql, hp, id)
  end
end