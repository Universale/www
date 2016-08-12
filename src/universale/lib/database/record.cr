require "./request_base"

class Record < RequestBase
  def self.create(params) : Int32
    self.insert_returning({"title" => params["title"],
      "data" => params["data"],
      "description" => params["description"],
      "category_id" => params["category_id"]
    })[0]["id"].to_i
  end
end
