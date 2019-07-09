require('pg')

class BountyHunter

attr_accessor :id, :name, :bounty_value, :favourite_weapon, :last_location

  def initialize (options)
    @id = options['id'] if options['id']
    @name = options['name']
    @bounty_value = options['bounty_value'].to_i
    @favourite_weapon = options['favourite_weapon']
    @last_location = options['last_location']
  end

  def save
    db = PG.connect({dbname: 'bounty_hunters', host: 'localhost'})
    sql = "INSERT INTO bounty_hunters (name, bounty_value, favourite_weapon, last_location)
    VALUES ($1, $2, $3, $4)
    RETURNING id;"
    values = [@name, @bounty_value, @favourite_weapon, @last_location]
    db.prepare('save', sql)
    bty_htrs = db.exec_prepared('save',values)
    @id = bty_htrs.first['id']
    db.close()
  end

  def update()
    db = PG.connect({ dbname: 'bounty_hunters', host: 'localhost'})
    sql = "UPDATE bounty_hunters SET (name, bounty_value, favourite_weapon, last_location)
    = ($1, $2, $3, $4)
    WHERE id = $5"
    values = [@name, @bounty_value, @favourite_weapon, @last_location, @id]
    db.prepare('update', sql)
    db.exec_prepared('update', values)
    db.close
  end

  def.self.delete(id)
    db = PG.connect({dbname: 'bounty_hunters', host: 'localhost'})
    sql = 'DELETE from bounty_hunters
    WHERE id = $1;'
    values =[id]
    db.prepare('delete', sql)
    db.exec_prepared('delete', values)
    db.close
  end


end
