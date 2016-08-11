class Record
  def self.create(params) : Int32
    r = DB.exec({Int32}, "INSERT INTO records (title, data, description, category_id)
VALUES ($1::text, $2::text, $3::text, $4::integer) RETURNING id;",
                [params["title"], params["data"], params["description"], params["category_id"]])
    r.to_hash[0]["id"]
  end
  def self.find(id)
    DB.exec({String, String, String, Int32}, "SELECT title, data, description, category_id
FROM records WHERE id = $1;", [id]).to_hash[0]
  end
end
