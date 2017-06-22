require "./model"

class Record < Model
  # columns title: String, data: String, description: String
  @@columns = {title: String, data: String, description: String}
end
