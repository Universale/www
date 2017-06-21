require "./model"

class Record < Model
  def self.default_fields
    {title: String, data: String, description: String}
  end
end
