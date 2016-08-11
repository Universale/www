class Category
  def self.first(n : Int)
    DB.exec({String}, "SELECT name FROM categories LIMIT $1", [n]).to_hash
  end
end
