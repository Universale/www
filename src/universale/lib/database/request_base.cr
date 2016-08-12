class RequestBase
  def self.table_name
    self.to_s.downcase.plurialize
  end

  def self.find(id : Int32)
    DB.exec("SELECT * FROM \"#{table_name}\" WHERE id = $1;", [id]).to_hash[0]
  end

  def self.where(hash : Hash(String, Class))
    forge = hash.map_with_index{|e, i| "\"#{e[0]}\" = $#{i+1}" }.join(" AND ")
    DB.exec("SELECT * FROM \"#{table_name}\" WHERE #{forge};", tuple).to_hash
  end

  private def self.insert_forge(hash)
    fields = hash.keys.map{|e| "\"#{e}\"" }.join(", ")
    fields_nb = hash.keys.map_with_index{|_, i| "$#{i+1}" }.join(", ")
    values = hash.values
    {fields: fields, fields_nb: fields_nb, values: values}
  end

  # TODO: multi-insert
  def self.insert(hash)
    forge = insert_forge(hash)
    DB.exec("INSERT INTO \"#{table_name}\" (#{forge[:fields]}) VALUES (#{forge[:fields_nb]});", forge[:values]).to_hash
  end

  def self.insert_returning(hash)
    forge = insert_forge(hash)
    DB.exec({Int32}, "INSERT INTO \"#{table_name}\" (#{forge[:fields]}) VALUES (#{forge[:fields_nb]}) RETURNING id;", forge[:values]).to_hash
  end
end
