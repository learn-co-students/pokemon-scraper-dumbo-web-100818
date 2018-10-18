class Pokemon


    attr_accessor :id, :name, :type, :db

    @@all = []

    def initialize (id)
      @id = id
      @@all << self
    end

    def self.all
      @@all
    end

    def self.save(name,type,db)
      db.execute("INSERT INTO pokemon (name, type) VALUES (?,?)", name,type)
    end
    def self.find(id,db)
      new_poke = db.execute("SELECT * FROM pokemon WHERE id = ?",id)
      my_poke = Pokemon.new(new_poke[0][0])
      my_poke.name = new_poke[0][1]
      my_poke.type = new_poke[0][2]
      my_poke
    end

end
