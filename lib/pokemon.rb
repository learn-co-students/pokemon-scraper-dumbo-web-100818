class Pokemon

  attr_accessor :name, :id, :type, :db
  def initialize(name:, id:, type:, db:)
    @name = name
    @id = id
    @type = type
    @db = db
  end

  def self.save(name, type, db)
    db.execute('INSERT INTO pokemon (name, type) VALUES (?, ?);', name, type)
  end

  def self.find(id_num, db)
    pokemon = db.execute('SELECT * FROM pokemon WHERE id = ?', id_num).flatten
    Pokemon.new(id: pokemon[0], name: pokemon[1], type: pokemon[2], db: db)
  end

  def alter_hp(changed_hp, db)
    db.execute('UPDATE pokemon SET hp = ? WHERE id = ?;', changed_hp, self.id)
  end
end

