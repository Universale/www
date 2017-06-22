require "./model"

class Category < Model
  # columns id: Int32, name: String
  @@columns = {id: Int32, name: String}
end
