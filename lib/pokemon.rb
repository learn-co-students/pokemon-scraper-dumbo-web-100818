class Pokemon

    attr_accessor :id, :name, :type, :db

    @@all = []

    def initialize (id:, name:, type: ,db: nil)
      @id = id
      @name = name
      @type = type
      @db = db
      @@all << self
    end

    def self.all
      @@all
    end

    def self.save(name,type,db)
      db.execute("INSERT INTO pokemon (name, type) VALUES (?,?)", name,type)
    end

    def self.find(id,db)
     new_poke = db.execute("SELECT * FROM pokemon WHERE id = (?)",id)
     Pokemon.new(id: new_poke[0][0],name: new_poke[0][1],type: new_poke[0][2])
    end

end
