require "./model"

class Category < Model
  def self.default_fields
    {id: Int32, name: String}
  end
end
